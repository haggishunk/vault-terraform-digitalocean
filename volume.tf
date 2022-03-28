data "digitalocean_volume_snapshot" "data_existing" {
  count       = var.existing_volume ? 1 : 0
  region      = var.region
  name_regex  = var.volume_name_regex
  most_recent = true
}

resource "digitalocean_volume" "data" {
  snapshot_id             = var.existing_volume ? data.digitalocean_volume_snapshot.data_existing[0].id : null
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
