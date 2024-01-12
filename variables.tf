variable "instance_machine_type" {
  default = "e2-micro"
  description = "type of machine for VM instance"
  type = string
}
variable "instance_name" {
  default = "debian-unifi"
  description = "name for vm instance"
  type = string
}
variable "project_name" {
  default = "unifi"
  description = "project to deploy to"
  type = string
}
variable "ssh_username" {
  default = "user1"
  description = "username for VM access"
  type = string
}
variable "firewall_allow_ip_ranges" {
  default = []
  type = list(string)
}
variable "region_name" {
  default = "us-central1"
  description = "region to deploy to"
  type = string
}
variable "zone_name" {
  default = "us-central1-c"
  description = "zone to deploy to"
  type = string
}
variable "instance_vm_image" {
  default = "debian-cloud/debian-10"
  description = "image to use for vm"
  type = string
}
variable "firewall_allow_port_list_tcp" {
  default = ["22", "443", "80", "8843", "8880", "6789"]
  type = list(string)
}
variable "firewall_allow_port_list_udp" {
  default = ["3478", "10001", "1900", "5514"]
  type = list(string)
}
variable "network_tier" {
  default = "STANDARD"
  type = string
}
variable "ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
  description = "path to ssh key for VM access"
  type = string
}
variable "ssh_pub_key" {
  default = null
  description = "ssh key for VM access, if specified, overrides ssh_key_path"
  type = string
}
variable "startup_script" {
  default = "sudo apt update && apt install -yq docker.io;sudo docker run -d --name=unifi -e PUID=1000 -e PGID=1000 -e MEM_LIMIT=900 -e MEM_STARTUP=1024 -p 3478:3478/udp -p 10001:10001/udp -p 80:8080 -p 443:8443 -p 1900:1900/udp -p 8843:8843 -p 8880:8880 -p 6789:6789 -p 5514:5514/udp -v /config:/config --restart unless-stopped lscr.io/linuxserver/unifi-controller"
  description = "commands for machine to run on startup"
  type = string
}
