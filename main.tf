terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"
  region  = var.region
}

resource "random_string" "random" {
    length = 4
}

resource google_compute_instance "default" {
    name         = var.instance_name-var.enviornment-random_string.random
    machine_type = var.machine_type
    zone         = var.zone
    labels       = var.labels

    boot_disk {
      initialize_params {
          image = ubuntu-os-cloud/ubuntu-1804-lts 
      }
    }
#subnet is not required by GCP as a provider since it is optional, as per TF docs.
    network_interface {
      network    = var.network_id

      access_config {
        nat_ip = var.public_ip
      } 
    }

    provisioner "remote-exec" {
        connection {
          host = self.public_ip
          type = "ssh"
          user = "root"
          password = var.root_password
        }

        inline = [
          "sudo apt install pwgen",
          "pwgen"
        ]
    }
}
