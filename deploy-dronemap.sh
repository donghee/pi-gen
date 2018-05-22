sudo apt-get install pv
IMG=deploy/image_2018-05-22-raspbian-dronemap.zip
SDCARD=/dev/sdb
#sudo umount /dev/sdb1
#sudo umount /dev/sdb2
sudo unzip -p $IMG | pv | sudo dd bs=4M of=$SDCARD conv=fsync
