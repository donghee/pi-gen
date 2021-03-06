#!/bin/bash -e

if [ ! -e files/FFmpeg-rpi-youtubelive-20180512.tgz ] ; then
  wget "http://dev.dronemap.io/files/FFmpeg-rpi-youtubelive-20180512.tgz" -O files/FFmpeg-rpi-youtubelive-20180512.tgz
fi

if [ ! -e files/gstreamer1.0-rpicamsrc_1.0.0_armhf.deb ] ; then
  wget "http://dev.dronemap.io/files/gstreamer1.0-rpicamsrc_1.0.0_armhf.deb" -O files/gstreamer1.0-rpicamsrc_1.0.0_armhf.deb
fi

cp -r files ${ROOTFS_DIR}/files

# enable camera
#echo "sudo raspi-config nonint do_camera 0"
echo "enable_uart=1" >> "${ROOTFS_DIR}/boot/config.txt"
echo "start_x=1" >> "${ROOTFS_DIR}/boot/config.txt"
echo "gpu_mem=128" >> "${ROOTFS_DIR}/boot/config.txt"
#install -m 644 files/config.txt "${ROOTFS_DIR}/boot/"

on_chroot << EOF
dpkg -i /files/*.deb
cd /files
tar xvfz FFmpeg-rpi-youtubelive-20180512.tgz
cd FFmpeg
make install
EOF
rm -rf ${ROOTFS_DIR}/files
