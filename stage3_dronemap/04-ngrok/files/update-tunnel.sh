#!/bin/sh

id=dronemap-changeme
tunnel_file=$(mktemp)
curl -s http://localhost:4040/http/in |sed -nE 's/.*PublicUrl\\":\\"tcp:..([^"]*)\\.*/\1/p' > $tunnel_file
tunnel=`cat $tunnel_file`
ip="${tunnel%:*}" 
port="${tunnel#*:}" 

curl -X POST \
     -H "Content-Type: application/json" \
     --data '{"uuid":"'$id'","ip":"'$ip'","port":"'$port'"}' \
     http://api.dronemap.io/v/vehicle_tunnel/$id
