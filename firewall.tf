resource "digitalocean_firewall" "vault-in" {
  count = var.existing_firewall ? 0 : 1
  name  = "vault-inbound"

  tags = [
    data.digitalocean_tag.app_vault.name,
    data.digitalocean_tag.role_secrets.name,
    data.digitalocean_tag.ssh_true.name,
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8200"
    source_addresses = var.source_addresses
  }
}
