#!/bin/bash

on_chroot apt-key add - < files/nodesource.gpg.key

on_chroot << EOF
echo "deb https://deb.nodesource.com/node_8.x stretch main" > /etc/apt/sources.list.d/nodesource.list
apt-get update
EOF
