terraform {
  source = "${get_terragrunt_dir()}/../terraform"
}

remote_state {
  backend = "s3"
  config = {
    endpoint = "sfo2.digitaloceanspaces.com"
    bucket   = "xforants"
    key      = "terraform/vault/terraform.tfstate"
    region   = "sfo2"
  }
}
