resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_cidr
  project       = var.project_id

  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = "10.1.0.0/16"
  }

  secondary_ip_range {
    range_name    = "service-range"
    ip_cidr_range = "10.2.0.0/16"
  }

  private_ip_google_access = true
}

variable "project_id" {}
variable "region" {}
variable "subnet_cidr" {}