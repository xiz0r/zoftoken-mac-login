#!bin/bash

# CONFIG
WORK_DIR=
HOST_NAME=
USER_ID=
SERVICE=
AUTH_KEY=
NO_2FA_USER=
# END CONFIG

if [ `whoami` == $NO_2FA_USER ]
then
    echo "Auth [NO_2FA_USER]: `whoami`, `date`"
    exit 1
fi

STATUS=$(curl -s "https://${HOST_NAME}/token/status?id=${USER_ID}&service=${SERVICE}&authKey=${AUTH_KEY}"  | grep 1)

if [ -z "$STATUS" ]
then
    osascript "$WORK_DIR/alert.applescript"
    sudo pkill loginwindow
    echo "Auth [Fail]: `whoami`, `date`"
else 
    echo "Auth [OK]: `whoami`, `date`"
fi


