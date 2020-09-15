resource "digitalocean_record" "vault" {
  domain = var.domain
  type   = "A"
  name   = var.name
  value  = digitalocean_droplet.vault.ipv4_address
}
