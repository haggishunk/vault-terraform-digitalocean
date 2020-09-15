storage "raft" {
  path    = "/opt/vault/data"
  node_id = "node1"
}

listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/opt/vault/tls/tls.crt"
  tls_key_file  = "/opt/vault/tls/tls.key"
}

mlock        = true
api_addr     = "http://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8200"
ui           = true
