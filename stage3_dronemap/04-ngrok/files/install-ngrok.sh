#sudo apt-get install -y bison git
#bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
#echo "[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"" >> ~/.bashrc
#source ~/.bashrc
#gvm install go1.4
#gvm use go1.4
#export GOROOT_BOOTSTRAP=$GOROOT
#sudo apt-get install build-essential mercurial
#git clone https://github.com/inconshreveable/ngrok.git ngrok

cd ngrok
openssl genrsa -out base.key 2048
openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN=tunnel.dronemap.io" -out base.pem
openssl genrsa -out server.key 2048
openssl req -new -key server.key -subj "/CN=tunnel.dronemap.io" -out server.csr
openssl x509 -req -in server.csr -CA base.pem -CAkey base.key -CAcreateserial -days 10000 -out server.crt

cp base.pem assets/client/tls/ngrokroot.crt
make release-server release-client
