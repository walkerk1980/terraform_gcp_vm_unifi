output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

output "admin_interface_url" {
  value = format(
    "https://%s/setup/",
    google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  )
}

output "ssh_pub_keys" {
  value = google_compute_instance.vm_instance.metadata
}