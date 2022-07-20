locals {
  # general module defs
  dir_files     = "${path.module}/files"
  dir_templates = "${path.module}/templates"

  module_tags = [
    "project:${var.project_name}",
    "name:${var.name}",
    "managed_by:terraform",
  ]

  tags = concat(
    local.module_tags,
    var.tags,
  )

  # remember max number of 5 tags ... keep them simple and sensibly scoped
  # use the `access:` tag key
  firewall_tags = ["access:${var.name}"]

  # stack specific defs
  vault_server_host = "${var.name}.${var.domain}"
  vault_server_url  = "http://${local.vault_server_host}"


  script_mount_volume = templatefile(
    "${local.dir_templates}/mount-volume-by-name.sh.tpl",
    {
      DATA_VOLUME_NAME  = var.volume_name
      DATA_VOLUME_MOUNT = var.volume_mount
    },
  )

  script_vault_setup = templatefile(
    "${local.dir_templates}/vault-install.sh.tpl",
    {
      TLS_CRT           = var.vault_tls_cert
      TLS_KEY           = var.vault_tls_key
      CA_CRT            = var.vault_ca_cert
      VAULT_HCL         = var.vault_hcl_config
      DATA_VOLUME_MOUNT = var.volume_mount
    },
  )

  script_ca_trust = templatefile(
    "${local.dir_templates}/ubuntu-ca-trust.sh.tpl",
    {
      CA_CRT = var.vault_ca_cert
    },
  )
}
