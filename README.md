# Zoftoken mac login

## Configuration
Edit z-install.sh file.

Set the values for the variables at the beginning of the file.

|Property|Description|
|---|---|
HOST_NAME|Server host, default value is zaas.zoftoken.com 
USER_ID|User name
SERVICE|Service name
AUTH_KEY|Auth key for your service
NO_2FA_USER|Local username that will NOT have 2FA enabled


## Install
Note: Before installing Zoftoken login make sure your service is open; otherwise, your current session will be closed.
```
sudo sh z-install.sh
```

## Uninstall
```
sudo sh z-uninstall.sh
```