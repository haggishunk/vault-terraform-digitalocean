# project level
variable project_name {
  type = string
}

# module level
variable name {
  type    = string
  default = "vault-dev"
}

variable tags {
  type        = list(string)
  description = "List of tag strings"
}

variable size {
  type    = string
  default = "1gb"
}

variable image {
  type = string
}

variable region {
  type    = string
  default = "sfo3"
}

variable private_networking {
  type    = bool
  default = true
}

variable existing_firewall {
  type    = bool
  default = false
}

variable monitoring {
  type    = bool
  default = true
}

variable ssh_keys {
  type = list(string)
}

variable source_addresses {
  type    = list(string)
  default = []
}

variable domain {
  type = string
}

variable existing_volume {
  type    = bool
  default = false
}

variable volume_name {
  type    = string
  default = "vault-data"
}

variable volume_name_regex {
  type    = string
  default = "^vault-data.*"
}

variable volume_mount {
  type    = string
  default = "/var/lib/vault"
}

variable volume_size {
  type    = number
  default = 10
}

variable volume_fs {
  type    = string
  default = "ext4"
}

variable vault_tls_cert {
  type = string
}

variable vault_tls_key {
  type = string
}

variable vault_ca_cert {
  type = string
}

variable vault_hcl_config {
  type = string
}
