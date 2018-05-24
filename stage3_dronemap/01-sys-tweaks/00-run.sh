#!/bin/bash -e

rm -f ${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/wait.conf

install -m 644 files/wpa_supplicant.conf ${ROOTFS_DIR}/boot
install -m 644 files/modules ${ROOTFS_DIR}/etc/modules
install -m 644 files/cmdline.txt ${ROOTFS_DIR}/boot
install -m 644 files/environment ${ROOTFS_DIR}/etc
install -m 644 /dev/null ${ROOTFS_DIR}/boot/ssh
install -m 644 files/interfaces ${ROOTFS_DIR}/etc/network

ln -sf /boot/wpa_supplicant.conf ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf

on_chroot << EOF
rm /etc/motd
systemctl disable hciuart

# Default timezone
#echo "Etc/UTC" > /etc/timezone 
echo "Asia/Seoul" > /etc/timezone 
dpkg-reconfigure -f noninteractive tzdata
EOF
