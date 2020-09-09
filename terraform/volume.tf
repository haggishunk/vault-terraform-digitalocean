resource "digitalocean_volume" "data" {
  region                  = var.region
  name                    = var.volume_name
  size                    = var.volume_size
  initial_filesystem_type = var.volume_fs
  description             = "vault stores data here"
}

resource "digitalocean_volume_attachment" "data" {
  droplet_id = digitalocean_droplet.vault.id
  volume_id  = digitalocean_volume.data.id
}
