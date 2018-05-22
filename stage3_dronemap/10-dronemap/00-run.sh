#!/bin/bash -e

install -m 755 files/rc.local           "${ROOTFS_DIR}/etc/"

#wget http://dev.dronemap.io/files/dronemap-rpi-20180522.tgz -O files/dronemap-rpi-20180522.tgz

cp -r files ${ROOTFS_DIR}/files

on_chroot << EOF
cd /files
tar xvfz dronemap-rpi-20180522.tgz
cp -r * /home/pi
chown 1000:1000 /home/pi/* -Rv
rm /home/pi/dronemap-rpi-20180522.tgz
EOF
rm -rf ${ROOTFS_DIR}/files
