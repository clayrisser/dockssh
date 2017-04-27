#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

curl -L -o /bin https://github.com/jamrizzi/dockssh/dockssh.py
chmod +x /bin/dockssh.py
