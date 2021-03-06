#!/bin/bash

# Colors to use for output
RED='\033[0;31m'
GREEN='\033[0;32m'


if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root"
   exit
fi
mkdir -p /usr/share/cockpit/assist
cd /usr/share/cockpit/assist/
for i in index.html manifest.json network.css.gz assist.js; do
	curl https://raw.githubusercontent.com/cyberorg/assist-cockpit/master/assist/$i > $i
done
echo -e "${GREEN} Cockpit Assist plugin installed"
