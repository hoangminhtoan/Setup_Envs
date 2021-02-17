if [ "$#" -ne 1 ]; then
  echo "Usage: $0 Location. Example [jp, vn, usa]"
  exit 1
fi

LOCATION=$1

cd "/media/toanhoang/Workspace/Setup/Ubuntu/VPN/"

if [[ "$LOCATION" == "jp" ]]; then
 echo "Welcome to Japan!"
 sudo openvpn jp-3558707062-8484.udp.vietpn.com.ovpn
elif [[ "$LOCATION" == "vn" ]]; then
 echo "Welcome to Vietnam!"
 sudo openvpn vn-852275024-8484.udp.vietpn.com.ovpn
else
 echo "Welcome to the USA!"
 sudo openvpn usa-3868753291-8484.udp.vietpn.com.ovpn
fi
