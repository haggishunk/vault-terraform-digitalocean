#!/bin/bash

# add ca cert
mkdir /usr/local/share/ca-certificates/vaultsigner
cat>/usr/local/share/ca-certificates/vaultsigner/ca.crt<<EOF
${CA_CRT}
EOF

update-ca-certificates
