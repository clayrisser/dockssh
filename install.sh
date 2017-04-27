#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

git clone https://github.com/jamrizzi/dockssh.git /tmp/dockssh
pip install -r /tmp/dockssh/requirements.txt
chmod +x /tmp/dockssh/dockssh.py
mv /tmp/dockssh/dockssh.py dockssh
