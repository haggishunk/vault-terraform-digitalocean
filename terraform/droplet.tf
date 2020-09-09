resource "digitalocean_droplet" "vault" {
  name               = var.name
  size               = var.size
  image              = var.image
  region             = var.region
  private_networking = var.private_networking
  monitoring         = var.monitoring
  ssh_keys           = var.ssh_keys
  tags = [
    data.digitalocean_tag.app_vault.name,
    data.digitalocean_tag.role_secrets.name,
    data.digitalocean_tag.ssh_true.name,
  ]
  user_data = data.template_cloudinit_config.config.rendered
}
