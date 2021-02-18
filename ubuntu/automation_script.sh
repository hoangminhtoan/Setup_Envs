if [ "$#" -ne 1 ]; then
  echo "Usage: $0 /path/to/script/file. Example [run_vpn.sh, install_opencv.sh, install_wine.sh, etc.]"
  exit 1
fi

SCRIPT=$1

echo "********** run script ${SCRIPT} **********"

if [[ "$SCRIPT" == "run_vpn.sh" ]]; then
 bash $SCRIPT "jp"
else
 bash $SCRIPT
fi
