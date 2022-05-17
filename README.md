# terraform_gcp_vm_unifi
terraform module to deploy unifi controller on GCP## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.unifi_firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_allow_ip_ranges"></a> [firewall\_allow\_ip\_ranges](#input\_firewall\_allow\_ip\_ranges) | n/a | `list(string)` | <pre>[<br>  "76.185.13.10/32"<br>]</pre> | no |
| <a name="input_firewall_allow_port_list_tcp"></a> [firewall\_allow\_port\_list\_tcp](#input\_firewall\_allow\_port\_list\_tcp) | n/a | `list(string)` | <pre>[<br>  "22",<br>  "443",<br>  "80",<br>  "8843",<br>  "8880",<br>  "6789"<br>]</pre> | no |
| <a name="input_firewall_allow_port_list_udp"></a> [firewall\_allow\_port\_list\_udp](#input\_firewall\_allow\_port\_list\_udp) | n/a | `list(string)` | <pre>[<br>  "3478",<br>  "10001",<br>  "1900",<br>  "5514"<br>]</pre> | no |
| <a name="input_instance_machine_type"></a> [instance\_machine\_type](#input\_instance\_machine\_type) | type of machine for VM instance | `string` | `"e2-micro"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | name for vm instance | `string` | `"debian-unifi"` | no |
| <a name="input_instance_vm_image"></a> [instance\_vm\_image](#input\_instance\_vm\_image) | image to use for vm | `string` | `"debian-cloud/debian-10"` | no |
| <a name="input_network_tier"></a> [network\_tier](#input\_network\_tier) | n/a | `string` | `"STANDARD"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | project to deploy to | `string` | `"unifi-236602"` | no |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | region to deploy to | `string` | `"us-central1"` | no |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | path to ssh key for VM access | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_ssh_username"></a> [ssh\_username](#input\_ssh\_username) | username for VM access | `string` | `"user1"` | no |
| <a name="input_startup_script"></a> [startup\_script](#input\_startup\_script) | commands for machine to run on startup | `string` | `"sudo apt update && apt install -yq docker.io;sudo docker run -d --name=unifi -e PUID=1000 -e PGID=1000 -e MEM_LIMIT=900 -e MEM_STARTUP=1024 -p 3478:3478/udp -p 10001:10001/udp -p 80:8080 -p 443:8443 -p 1900:1900/udp -p 8843:8843 -p 8880:8880 -p 6789:6789 -p 5514:5514/udp -v /config:/config --restart unless-stopped lscr.io/linuxserver/unifi-controller"` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | zone to deploy to | `string` | `"us-central1-c"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_interface_url"></a> [admin\_interface\_url](#output\_admin\_interface\_url) | n/a |
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
| <a name="output_ssh_pub_keys"></a> [ssh\_pub\_keys](#output\_ssh\_pub\_keys) | n/a |
