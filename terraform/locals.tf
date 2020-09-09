locals {
  # general module defs
  dir_files     = "${path.module}/files"
  dir_templates = "${path.module}/templates"

  module_tags = [
    "project:${var.project_name}",
  ]

  tags = concat(
    local.module_tags,
    var.tags,
  )

  # stack specific defs
  vault_server_host = "vault.${var.domain}"
  vault_server_url  = "http://${local.vault_server_host}"


  script_mount_volume = templatefile(
    "${local.dir_templates}/mount-volume-by-name.sh.tpl",
    {
      DATA_VOLUME_NAME = var.volume_name
    },
  )

  script_vault_setup = templatefile(
    "${local.dir_templates}/vault-install.sh.tpl",
    {
      TLS_CRT   = file(var.vault_tls_cert_file)
      TLS_KEY   = file(var.vault_tls_key_file)
      CA_CRT    = file(var.vault_ca_cert_file)
      VAULT_HCL = file(var.vault_hcl_config_file)
    },
  )

  script_ca_trust = templatefile(
    "${local.dir_templates}/ubuntu-ca-trust.sh.tpl",
    {
      CA_CRT = file(var.vault_ca_cert_file)
    },
  )
}
