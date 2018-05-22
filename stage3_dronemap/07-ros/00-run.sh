#!/bin/bash

on_chroot apt-key add - < files/ros.key

if [ ! -e files/install_geographiclib_datasets.sh ] ; then
  wget "https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh" -O files/install_geographiclib_datasets.sh
fi

chmod 777 files/install_geographiclib_datasets.sh

cp -r files ${ROOTFS_DIR}/files
on_chroot << EOF
dpkg -i /files/*.deb
#apt-get install geographiclib-tools -y
echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list
apt-get update
mkdir -p /usr/share/GeographicLib
bash /files/install_geographiclib_datasets.sh
EOF
rm -rf ${ROOTFS_DIR}/files
