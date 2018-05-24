#!/bin/bash -e

install -m 644 files/hostname ${ROOTFS_DIR}/etc/hostname
install -m 644 files/70-usb-modeswitch.rules ${ROOTFS_DIR}/etc/udev/rules.d
install -m 644 files/usb_modeswitch.conf ${ROOTFS_DIR}/etc
install -m 644 files/qmi-network.conf ${ROOTFS_DIR}/etc
install -m 644 files/lte-qmi.sh ${ROOTFS_DIR}/usr/local/bin

#if [ ! -e files/rpi-source ] ; then
#  wget "https://raw.githubusercontent.com/notro/rpi-source/master/rpi-source" -O files/rpi-source 
#  chmod +x files/rpi-source
#fi

cp -r files ${ROOTFS_DIR}/files

on_chroot << EOF
dpkg -i /files/*.deb

#bash /files/realtek-rt8812au_emlid
#/files/rpi-source -q --tag-update
#/files/rpi-source --skip-gcc

#git clone https://github.com/emlid/8812au.git
#cd 8812au
#git checkout v4.3.21
#make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm
#sudo insmod 8812au.ko
#sudo cp 8812au.ko /lib/modules/4.14.34-v7+/kernel/drivers/net/wireless
#sudo depmod
#cp rtl8812-txpower.rules /etc/udev/rules.d/rtl8812-txpower.rules
#cd ..
#rm -rf linux*

#for fastboot
mv /etc/systemd/system/dhcpcd.service.d/wait.conf /etc/systemd/system/dhcpcd.service.d/wait.conf_

EOF
rm -rf ${ROOTFS_DIR}/files
