resource "digitalocean_floating_ip" "vault" {
  droplet_id = digitalocean_droplet.vault.id
  region     = digitalocean_droplet.vault.region
}
