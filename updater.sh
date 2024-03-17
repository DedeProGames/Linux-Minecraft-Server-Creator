#!/usr/bin/bash

root=$PWD
cd /home/runner/RMS-V2-or-Replits-Minecraft-Server/

rm -rf webstatus.log
rm -rf status.log
rm -rf ip.txt
rm -rf Server
rm -rf difficulty.sh
rm -rf gamemode.sh
rm -rf settings.sh
echo "Launching Installer"
bash main.sh