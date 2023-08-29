locals {
  resource_name = "comet-${var.environment}"
  ssh_access    = var.vm_enable_ssh ? google_compute_firewall.allow_ssh[0].target_tags : ["no-ssh-access"]
}

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = var.project_id
  names         = ["${local.resource_name}-vm-sa"]
}

resource "google_project_iam_member" "vm_sa_storage_binding" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${module.service_accounts.email}"

  condition {
    title       = "comet_bucket_only"
    expression  = "resource.name.startsWith(\"projects/_/buckets/${var.vm_sa_s3_bucket_name}\")"
  }
}

resource "google_storage_hmac_key" "key" {
  service_account_email = module.service_accounts.email
}

module "vm_instance_template" {
  source     = "terraform-google-modules/vm/google//modules/instance_template"
  project_id = var.project_id
  subnetwork = var.vm_subnetwork
  service_account = {
    email  = module.service_accounts.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  source_image_family = var.vm_source_image_family
  source_image_project = var.vm_source_image_family == "rhel-7" ? "rhel-cloud" : (
    var.vm_source_image_family == "rhel-8" ? "rhel-cloud" : (
      var.vm_source_image_family == "rhel-9" ? "rhel-cloud" : (
        var.vm_source_image_family == "ubuntu-2004-lts" ? "ubuntu-os-cloud" : (
          var.vm_source_image_family == "ubuntu-2204-lts" ? "ubuntu-os-cloud" : (
  null)))))
  machine_type   = var.vm_machine_type
  disk_type      = var.vm_disk_type
  disk_size_gb   = var.vm_disk_size_gb
  auto_delete    = var.vm_disk_auto_delete
  tags           = concat([local.resource_name], tolist(local.ssh_access))
  startup_script = var.enable_mysql ? "curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.6.0/cloud-sql-proxy.linux.amd64 && chmod +x cloud-sql-proxy && ./cloud-sql-proxy --port 3306 --private-ip ${var.vm_mysql_connection_name}" : null
}

module "managed_instance_group" {
  source            = "terraform-google-modules/vm/google//modules/mig"
  project_id        = var.project_id
  region            = var.region
  instance_template = module.vm_instance_template.self_link
  hostname          = local.resource_name
  named_ports = [
    {
      name = "http"
      port = 80
    }
  ]
}

resource "google_compute_firewall" "allow_ssh" {
  count   = var.vm_enable_ssh ? 1 : 0
  name    = "allow-ssh"
  network = var.vm_vpc

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-access"]
}