provider "google" {
  version = "3.5.0"

  credentials = file(<include jSON>)


  project = "<Project ID>"
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
  name = var.vpcnetwork
}

resource "google_compute_instance" "vm_instance" {
  name         = "tf-instance"
  machine_type = "f1-micro"

  #provisioner "local-exec" {
  #   command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  #  }

  boot_disk {
    initialize_params {
      image = var.image_id
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

module "mod_instance" {
  source          = "./New folder"
  number_instance = 2
  image_id        = "centos-7"
  compute_vpc     = google_compute_network.vpc_network.name


}





