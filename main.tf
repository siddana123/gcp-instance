provider "google" {  
  project = "unique-balancer-327214"  
  region  = "us-central1" 
  zone    = "us-central1-c"
  }
resource "google_compute_network" "default" { 
     name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" { 
     name         = "terraform-instance" 
     machine_type = "f1-micro"
  boot_disk { 
         initialize_params {     
              image = "debian-cloud/debian-9"    
              }
                }
  network_interface {    
      network = google_compute_network.default.name 
         access_config { 

            } 
        }
      

 
  resource "google_compute_firewall" "allow-port-ssh" {
  name    = "test-firewall"
 network = google_compute_network.default.name 
  allow {
    protocol = "tcp"
    ports    = ["80", "22", "8080", "1000-2000"]

  }
 allow {
    #protocol = "icmp"
    protocol = "ssh"
  }
  source_tags = ["web"]
}
    }
