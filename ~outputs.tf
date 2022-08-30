output "vault_server_url" {
  value = local.vault_server_url
}

output "vault_server_ip" {
  value = digitalocean_floating_ip.vault.ip_address
}

output "vault_firewall_access_source_tags" {
  value = local.firewall_source_tags
}
