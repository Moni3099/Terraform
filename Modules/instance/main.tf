resource "google_compute_address" "winip"{
  name = "${var.ipname}"
  #region = "${var.ipregion}"

resource "google_compute_instance" "wininsta1" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  #tags = ["win_ins"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # Local SSD disk
  #scratch_disk {
   # interface = "SCSI"
  #}

  network_interface {
    network = "${var.vpc_name}"
    subnetwork = "${var.subnet_name}"
    #access_config {
      #Ephemeral IP
     # nat_ip       = "${google_compute_address.winip}"
     # network_tier = "PREMIUM"
    #}
  }

  #metadata = {
   # foo = "bar"
  #}

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["cloud-platform"] 
    #To allow full access to all Cloud APIs,
  }
}
