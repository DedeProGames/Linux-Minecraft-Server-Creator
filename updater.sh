#!/usr/bin/bash

root=$PWD
cd ..

rm -rf webstatus.log
rm -rf status.log
rm -rf ip.txt
rm -rf Server
rm -rf difficulty.sh
rm -rf gamemode.sh
rm -rf settings.sh
rm -rf version
rm -rf .config
echo "Launching Installer"
bash main.sh
