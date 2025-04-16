provider "google" {
  credentials = file("gcp-credentials.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    systemctl enable docker
    systemctl start docker
  EOT

  tags = ["devops", "docker"]
}
