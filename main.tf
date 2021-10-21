provider "google" {  
  project = "unique-balancer-327214"  
  region  = "us-east1" 
  }
resource "google_compute_instance" "my_vm" {
  name         = "tf-tutorial-vm"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-10"

    }

  }

  network_interface {

    network = "default"

    access_config {}

  }

}
