resource "digitalocean_floating_ip" "vault" {
  region = digitalocean_droplet.vault.region
}

resource "digitalocean_floating_ip_assignment" "vault" {
  ip_address = digitalocean_floating_ip.vault.ip_address
  droplet_id = digitalocean_droplet.vault.id
}
