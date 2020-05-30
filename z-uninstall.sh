#!bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root: sudo sh uninstall.sh"
  exit
fi

INSTALL_DIR='/Library/Application Support/ZofToken'

echo "Uninstalling ZofToken 2FA..."
launchctl unload /Library/LaunchAgents/com.zoftoken.agent.plist
sudo rm /Library/LaunchAgents/com.zoftoken.agent.plist

sudo rm -r "$INSTALL_DIR"

echo "Uninstall complete."
