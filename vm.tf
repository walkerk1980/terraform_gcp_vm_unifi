resource "google_compute_instance" "vm_instance" {
  name         = "debian-unifi"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
  metadata = {
    ssh-keys = format(
      "%s:%s",
      var.ssh_username,
      file(var.ssh_key_path)
    )
  }
  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
