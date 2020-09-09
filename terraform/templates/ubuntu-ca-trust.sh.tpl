#!/bin/bash

# add ca cert
mkdir /etc/ca-certificates/vaultsigner
cat>/etc/ca-certificates/vaultsigner/ca.crt<<EOF
${CA_CRT}
EOF

update-ca-certificates
