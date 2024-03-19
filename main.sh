#!/bin/bash

# Minecraft version
VERSION=1.17.1
BUILD=411

set -e
root=$PWD
mkdir -p version
mkdir -p Server
mkdir -p .config
cd .config
mkdir -p ngrok
cd ..

export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

#This Gonna Download All Files
download() {
    set -e
    echo -e "\e[1;32mBy executing this script you agree to the JRE License, the PaperMC license,\e[0m"
    echo the Mojang Minecraft EULA,
    echo the NPM license, the MIT license,
    echo and the licenses of all packages used \in this project.
    echo ============================
    echo Press Ctrl+C \if you \do not agree to any of these licenses.
    echo Press Enter to agree.
    read -s agree_text
    echo Thank you \for agreeing, the download will now begin.
    echo ============================
    cd ..
    #This Gonna create Files
    echo -e "\e[1;32mCreating Files\e[0m"
    echo "Creating File: ip.txt"
    touch ip.txt
    echo "Creating File: status.log"
    touch status.log
    echo "Creating File: webstatus.log"
    touch webstatus.log
    echo "Creating File: /.config/ngrok/ngrok.yml/"
    cd .config
    cd ngrok
    wget -O ngrok https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/ngrok.yml
    cd ..
    cd ..
    echo ============================
    #This gonna Download All Settings Files
    echo -e "\e[1;32mDownloading All Settings File\e[0m"
    wget -O difficulty.sh https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/difficulty.sh
    wget -O settings.sh https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/settings.sh
    wget -O gamemode.sh https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/gamemode.sh
    cd Server
    #This gonna Download Server Assets and Update Checker
    read -r -p "
    Type of Minecraft Server:
    1) Paper Server
    2) Forge Server [Beta]
    Choose a Number from 1 to 2
    > " response
    if [[ "$response" =~ ^([1][eE][sS]|[1])$ ]]
    then
        echo -e "\e[1;32mDownloading server.jar\e[0m"
        wget -O server.jar "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar"
    fi 
    if [[ "$response" =~ ^([2][eE][sS]|[2])$ ]]
    then
        echo -e "\e[1;32mDownloading server.jar\e[0m"

        wget -O serverinstaller.jar "https://github.com/DedeProGames/Linux-Minecraft-Server-Creator/raw/main/forge-1.12.1-14.22.1.2485-installer.jar"
        wget -O server.jar "https://github.com/DedeProGames/Linux-Minecraft-Server-Creator/raw/main/server.jar"
        
        java -jar serverinstaller.jar --installServer
        

    fi 
    
    echo -e "\e[1;32mDownloading server.proprieties\e[0m"
    wget -O server.properties https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/server.properties

    cd ..
    echo -e "\e[1;32mDownloading updater.sh\e[0m"
    wget -O updater.sh https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/updater.sh
    cd Server
    echo -e "\e[1;32mDownloading eula.txt\e[0m"
    wget -O eula.txt https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/eula.txt
    cd ..
    cd version
    echo -e "\e[1;32mDownloading version.proprieties\e[0m"
    wget -O version.properties https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/version.properties
    echo -e "\e[1;32mDownloading versioncheck.sh\e[0m"
    wget -O versioncheck.sh https://raw.githubusercontent.com/DedeProGames/Linux-Minecraft-Server-Creator/main/versioncheck.sh
    cd ..
    cd Server
    echo -e ngrok "\e[1;32mDownloading Ngrok\e[0m"
    wget -O ngrok https://github.com/DedeProGames/Linux-Minecraft-Server-Creator/raw/main/ngrok
    
    echo ============================
    #File Setup
    echo -e "\e[1;32mSetting UP Files\e[0m"
    #unzip ngrok.zip
    #rm -rf ngrok.zip
}   

#This gonna enable Download if a File isnt here
require() {
    if [ ! $1 $2 ]; then
        echo $3
        #echo "Running download..."
        download
    fi
}
#This gonna enable Download if a Secret isnt here
require_file() { require -f $1 "File $1 required but not found"; }
require_dir()  { require -d $1 "Directory $1 required but not found"; }
require_env()  {
    var=`python3 -c "import os;print(os.getenv('$1',''))"`
    if [ -z "${var}" ]; then
        echo "Environment variable $1 not set. "
        echo "In your .env file, add a line with:"
        echo "$1="
        echo "and then right after the = add $2"
        exit
    fi
    eval "$1=$var"
}
require_executable() {
    require_file "$1"
    chmod +x "$1"
}
cd Server
#This is the file Checker
require_file "eula.txt"
require_file "server.properties"
require_file "server.jar"
#require_file "forge-1.12.1-14.22.1.2485-universal.jar"
cd ..
require_file ip.txt
require_file webstatus.log
require_file status.log
require_file settings.sh
require_file difficulty.sh
require_file gamemode.sh
require_file launch.properties
require_file ram.sh
cd version
require_file versioncheck.sh
cd ..

cd Server
# java
#require_dir "jre"
#require_executable "jre/bin/java"
# ngrok binary
require_executable "ngrok"


# environment variables
require_env "ngrok_token" "your ngrok authtoken from https://dashboard.ngrok.com"
require_env "ngrok_region" "your region, you can see all in README.md, but i recommend us"

clear
cd ..
cd version
bash versioncheck.sh
cd ..
cd Server

read -r -p "
Minecraft Server Launcher
1) Launch Server
2) Server Settings
3) Change Launch RAM
Choose a Number from 1 to 2
> " response
if [[ "$response" =~ ^([1][eE][sS]|[1])$ ]]
then
    clear
fi    

if [[ "$response" =~ ^([2][eE][sS]|[2])$ ]]
then 
    clear
    cd ..
    bash settings.sh
    cd Server
fi

if [[ "$response" =~ ^([3][eE][sS]|[3])$ ]]
then 
    clear
    cd ..
    bash ram.sh
    cd Server
fi

echo "Minecraft server starting, please wait" > $root/status.log
echo""
echo -e "\e[1;34mStarting TCP Tunnel\e[0m"
# start tunnel
mkdir -p ./logs
touch ./logs/temp # avoid "no such file or directory"
rm ./logs/*
echo "Starting ngrok tunnel in region $ngrok_region"
./ngrok authtoken $ngrok_token
./ngrok tcp --region=us --log=stdout 25565 > $root/status.log &
#./ngrok tcp 25565
echo "Tunneling started"
echo ""
#echo -e "\e[1;34mStarting HTTP Page\e[0m"
#caddy start --config ./Caddyfile > /dev/null 2>&1

#./ngrok http 80 --log=stdout > $root/webstatus.log &
echo "=============IP==============="
#This gonna Get Server IP
echo -e "\e[1;34mGetting Server IP\e[0m"
tail -f $root/status.log | sed '/started tunnel/ q'
orig_server_ip=`curl --silent http://127.0.0.1:4040/api/tunnels | jq '.tunnels[0].public_url'`
trimmed_server_ip=`echo $orig_server_ip | grep -o '[a-zA-Z0-9.]*\.ngrok.io[0-9:]*'`
server_ip="${trimmed_server_ip:-$orig_server_ip}"
echo "Server IP is: $server_ip"
echo "Server IP is: $server_ip" > $root/ip.txt
echo ""

cd ..

file="./launch.properties"

function ram {
    grep "${1}" ${file} | cut -d'=' -f2
}

echo "RAM =         " $(ram 'ram')
launchram=$(ram 'ram')
cd Server

#this Gonna Start Server
echo "===========Starting==========="
echo "Starting minecraft server version "$VERSION 
echo -e "\e[1;33mStarting Minecraft Server in IP: \e[0m" $server_ip
echo -e "\e[1;33m*** Go to ip.txt File to Copy Server IP ***\e[0m"
echo "Starting minecraft server with " $launchram " of RAM"
echo "===========Server============="
java -Xmx"$launchram"M -Xms"$launchram"M -jar server.jar nogui
echo "Server request: End Server"
echo "Chunks are been saved :D"
#java -jar server.jar --installServer
#java -Xms3G -Xmx4G -jar server.jar --nogui
#java -Xms3G -Xmx4G -jar server.jar --nogui
#java -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -Xms3G -Xmx4G -jar server.jar --nogui





