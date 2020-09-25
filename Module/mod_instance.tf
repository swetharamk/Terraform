resource "google_compute_instance" "mod_instance" {
  count = var.number_instance
  name = "tf-instance-var-${count.index}"
  machine_type = "f1-micro"
  boot_disk {
      initialize_params {
        image = var.image_id
      }  
    }
  network_interface {
      network = var.compute_vpc
      access_config {
      }
    }
}

