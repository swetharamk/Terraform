output "mod_instance_ip" {
  value = google_compute_instance.mod_instance[*].network_interface[0].access_config[0].nat_ip
}
output "mod_instance_name" {
  value = google_compute_instance.mod_instance[*].name
}