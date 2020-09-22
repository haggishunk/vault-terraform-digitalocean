resource "digitalocean_record" "vault" {
  domain = var.domain
  type   = "A"
  name   = var.name
  value  = digitalocean_floating_ip.vault.ip_address
}
