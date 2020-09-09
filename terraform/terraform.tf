terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

# perhaps terraform 13 does it differently
# remote_state "s3" {
#   endpoint = "sfo2.digitaloceanspaces.com"
#   bucket   = "xforants"
#   key      = "terraform/vault/terraform.tfstate"
#   region   = "sfo2"
# }
