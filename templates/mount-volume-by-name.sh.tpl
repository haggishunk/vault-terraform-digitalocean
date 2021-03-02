#!/bin/bash

MOUNT_OPTS="defaults,nofail,discard,noatime"

# data volume mount point
mkdir -p "$DATA_VOLUME_MOUNT"

# persistent device mapping
cat>>/etc/fstab<<EOF
/dev/disk/by-id/scsi-0DO_Volume_$DATA_VOLUME_NAME $DATA_VOLUME_MOUNT ext4 $MOUNT_OPTS 0 2
EOF

# mount volume
mount -a
