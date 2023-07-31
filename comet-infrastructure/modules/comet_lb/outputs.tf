output "lb_external_ip" {
  description = "External IP address for the load balancer"
  value = module.gce-app-lb.external_ip
}