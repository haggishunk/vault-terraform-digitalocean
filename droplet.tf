resource "digitalocean_droplet" "vault" {
  name               = var.name
  size               = var.size
  image              = var.image
  region             = var.region
  private_networking = var.private_networking
  monitoring         = var.monitoring
  ssh_keys           = var.ssh_keys
  tags               = local.tags
  user_data          = data.template_cloudinit_config.config.rendered
}
