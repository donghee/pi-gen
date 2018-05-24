#!/bin/bash -e

install -m 644 files/.ngrok "${ROOTFS_DIR}/home/pi"
#install -m 644 files/install-ngrok.sh "${ROOTFS_DIR}/home/pi/"

# ngrok 1.7
install -m 644 files/ngrok "${ROOTFS_DIR}/usr/local/bin/"
