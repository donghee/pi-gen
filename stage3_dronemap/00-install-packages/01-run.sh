#!/bin/bash -e

on_chroot << EOF
# Configure timezone and locale
echo "Asia/Seoul" > /etc/timezone && \
   dpkg-reconfigure -f noninteractive tzdata && \
   sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
   echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
   dpkg-reconfigure --frontend=noninteractive locales && \
   update-locale LANG=en_US.UTF-8
EOF
