#!bin/bash
#### Zoftoken settings

HOST_NAME="zaas.zoftoken.com"
USER_ID=""
SERVICE=""
AUTH_KEY=""
NO_2FA_USER=""

####

if [ "$EUID" -ne 0 ]
  then echo "Please run as root: sudo sh install.sh"
  exit
fi

INSTALL_DIR='/Library/Application Support/ZofToken'

echo "Installing ZofToken 2FA..."

sudo mkdir -pv "$INSTALL_DIR"
cp main.sh alert.applescript "$INSTALL_DIR"

sed -i '.org' -e "s+HOST_NAME=+HOST_NAME=\"$HOST_NAME\"+g" "$INSTALL_DIR/main.sh"
sed -i '.org' -e "s+WORK_DIR=+WORK_DIR=\"$INSTALL_DIR\"+g" "$INSTALL_DIR/main.sh" 
sed -i '.org' -e "s+USER_ID=+USER_ID=\"$USER_ID\"+g" "$INSTALL_DIR/main.sh" 
sed -i '.org' -e "s+SERVICE=+SERVICE=\"$SERVICE\"+g" "$INSTALL_DIR/main.sh" 
sed -i '.org' -e "s+AUTH_KEY=+AUTH_KEY=\"$AUTH_KEY\"+g" "$INSTALL_DIR/main.sh" 
sed -i '.org' -e "s+NO_2FA_USER=+NO_2FA_USER=\"$NO_2FA_USER\"+g" "$INSTALL_DIR/main.sh" 

rm "$INSTALL_DIR/main.sh.org"

echo "" > "$INSTALL_DIR/stderr.log"
echo "" > "$INSTALL_DIR/stdout.log"

sudo chown -R root:wheel "$INSTALL_DIR"
sudo chmod -R 755 "$INSTALL_DIR"
sudo chmod 766 "$INSTALL_DIR/stderr.log" "$INSTALL_DIR/stdout.log"

echo "Loading ZofToken launch agent..."
sudo cp com.zoftoken.agent.plist /Library/LaunchAgents
launchctl load /Library/LaunchAgents/com.zoftoken.agent.plist

echo "Adding user to sudorers..."
sudo echo "%localaccounts        ALL = (ALL) NOPASSWD:/usr/bin/pkill" >> /etc/sudoers

echo "Install complete"