provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.region}"
}

// Create VPC
resource "google_compute_network" "tesvpc" {
 name                    = "${var.vpc_name}-vpc"
 auto_create_subnetworks = "false"
}

// Create Subnet
resource "google_compute_subnetwork" "subnet" {
 name          = "${var.subnet_name}-subnet"
 ip_cidr_range = "${var.subnet_cidr}"
 network       = "${var.vpc_name}-vpc"
 depends_on    = ["google_compute_network.tesvpc"]
 region      = "${var.region}"
}
