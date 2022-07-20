resource "digitalocean_firewall" "vault-in" {
  count = var.existing_firewall ? 0 : 1
  name  = "vault-inbound"

  droplet_ids = [digitalocean_droplet.vault.id]
  tags        = local.firewall_tags

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8200"
    source_addresses = var.source_addresses
  }
}
