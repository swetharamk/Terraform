output "name" {
  value = google_compute_instance.vm_instance.name
}
output "Ip_address" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "mod_ips" {
  value = module.mod_instance.mod_instance_ip
}

output "mod_name" {
  value = module.mod_instance.mod_instance_name
}