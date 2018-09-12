#!/bin/bash -e

# ngrok configure
install -m 644 files/.ngrok "${ROOTFS_DIR}/home/pi"

# ngrok 1.7
install -m 644 files/ngrok "${ROOTFS_DIR}/usr/local/bin/"

# update-tunnel.sh
install -m 644 files/update-tunnel.sh "${ROOTFS_DIR}/home/pi/bin/update-tunnel.sh"
