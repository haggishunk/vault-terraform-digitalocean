data "digitalocean_tag" "role_secrets" {
  name = "role:secrets"
}

data "digitalocean_tag" "app_vault" {
  name = "app:vault"
}

data "digitalocean_tag" "ssh_true" {
  name = "ssh:true"
}

data "digitalocean_domain" "this" {
  name = var.domain
}

data "template_cloudinit_config" "config" {
  # digital ocean does not like gzipped or encoded data
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = local.script_mount_volume
  }

  part {
    content_type = "text/x-shellscript"
    content      = local.script_vault_setup
  }

  part {
    content_type = "text/x-shellscript"
    content      = local.script_ca_trust
  }
}
