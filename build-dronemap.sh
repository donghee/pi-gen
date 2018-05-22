# Example for building a lite system
echo "IMG_NAME='raspbian'" > config
mv stage3 stage3_upstream
touch ./stage3_upstream/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage3_upstream/SKIP_IMAGES ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
sudo ./build.sh  # or ./build-docker.sh
