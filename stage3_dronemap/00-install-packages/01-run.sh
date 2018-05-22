#!/bin/bash -e

on_chroot << EOF
dpkg-reconfigure locales # add the en_US.UTF-8 locale and set as default
export LANGUAGE=en_US.UTF-8 
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
update-locale en_US.UTF-8
EOF
