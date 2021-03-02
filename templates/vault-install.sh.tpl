#!/bin/bash

# install vault
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get -y update && \
    sudo apt-get -y install vault 
    
# enable mlock use by vault
setcap cap_ipc_lock=+ep $(readlink -f $(which vault))

# add tls cert and key files
cat>/opt/vault/tls/tls.crt<<EOF
${TLS_CRT}
EOF

cat>/opt/vault/tls/tls.key<<EOF
${TLS_KEY}
EOF

# append add ca cert for self trust (only necessary for private CA-signed tls certs)
cat>>/opt/vault/tls/tls.crt<<EOF
${CA_CRT}
EOF

# locate config file
cat>/etc/vault.d/vault.hcl<<EOF
${VAULT_HCL}
EOF

# run vault
systemctl start vault
systemctl enable vault
