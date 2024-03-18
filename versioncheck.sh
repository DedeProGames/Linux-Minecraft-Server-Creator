#!/usr/bin/bash

echo "Checking for Updates"
set -e
root=$PWD
cd $PWD
rm -rf versionnew.properties
wget -O versionnew.properties https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/version.properties
clear
file="./versionnew.properties"

function new {
    grep "${1}" ${file} | cut -d'=' -f2
}

echo "Founded version =         " $(new 'version')

file="./version.properties"

function thisdvc {
    grep "${1}" ${file} | cut -d'=' -f2
}

echo "In This Device =         " $(thisdvc 'version')

Device=$(thisdvc 'version')
Server=$(new 'version')
    echo No Updates found

if [ "$Device" -lt "$Server" ]; then
    echo "New Version Found | Version:" $(new 'version')
    echo "Launching File Updater"
    cd ..
    bash updater.sh
else
    if [ "$Device" -eq "$Server" ]; then
        echo "No updates Found"
    else
        echo "No updates Found"
    fi
fi

# Output:
# '10 is not greater than 20'
