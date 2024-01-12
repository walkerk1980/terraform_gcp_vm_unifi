resource "google_compute_firewall" "unifi_firewall" {
  name = "unifi-firewall"
  network = "default"
  source_ranges = var.firewall_allow_ip_ranges
  allow {
    ports = var.firewall_allow_port_list_tcp
    protocol = "tcp"
  }
  allow {
    ports = var.firewall_allow_port_list_tcp
    protocol = "udp"
  }
}

resource google_compute_instance vm_instance {
  name = var.instance_name
  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.instance_vm_image
    }
  }
  machine_type = var.instance_machine_type
  metadata = {
    ssh-keys = "${var.ssh_username}:${local.ssh_key}"
  }
  metadata_startup_script = var.startup_script
  network_interface {
    access_config {
      network_tier = var.network_tier
    }
    network = "default"
  }
}


