########################
#### Module toggles ####
########################
# Provision a VPC to launch other resources in
enable_vpc = false

# Provision a Google Compute Engine VM for running Comet
enable_vm = false

# Provision a load balancer for the Comet VM
enable_lb = false

# Provision a GKE cluster for running Comet
enable_gke = false

# Provision Memorystore resources for running Comet Redis
enable_memorystore = false

# Provision Google Cloud SQL resources for the Comet MySQL database
enable_mysql = false

# Provision a GCS bucket for storing Comet objects
enable_s3 = false

################
#### Global ####
################
# Specify the GCP project ID
project_id = "project-id"

# If provisioning the resources in an existing VPC, set the variables below
comet_vpc_zones       = ["zone-1", "zone-2", "zone-3"]
comet_vpc_name        = "vpc-name"
comet_vpc_subnet_name = "subnet-name"

#######################
#### Module inputs ####
#######################
## Required module inputs listed below. Any desired overrides from the defaults in variables.tf can also be added here

#### comet_vpc ####
#

#### comet_vm ####
#

#### comet_lb ####
#lb_enable_ssl = true
#lb_managed_ssl_certificate_domains = [""]

#### comet_gke ####
## If provisioning GKE in an existing VPC, the the pods and services cidr_name variables below
#gke_pods_cidr_name     = "secondary-pod-cidr-name"
#gke_services_cidr_name = "secondary-service-cidr-name"
#

#### comet_memorystore ####
#

#### comet_mysql ####
## If provisioning MySQL, set the db_password below
#db_password  = null

#### comet_s3 ####
#