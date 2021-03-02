#!/bin/bash

MOUNT_OPTS="defaults,nofail,discard,noatime"

# mount data volume
mkdir -p "${DATA_VOLUME_MOUNT}"

# device mapping
DATA_VOLUME_MAPPING="/dev/disk/by-id/scsi-0DO_Volume_${DATA_VOLUME_NAME} ${DATA_VOLUME_MOUNT}"
mount -o "$MOUNT_OPTS" "$DATA_VOLUME_MAPPING"
echo "$DATA_VOLUME_MAPPING ext4 "$MOUNT_OPTS" 0 2" >> /etc/fstab
