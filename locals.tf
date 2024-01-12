locals {
  ssh_key = var.ssh_pub_key != null ? var.ssh_pub_key : file(var.ssh_key_path)
}