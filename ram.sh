read -r -p "
Minecraft Server Launcher
1) 512MB
2) 1GB
3) 2GB
Choose a Number from 1 to 2
> " response
if [[ "$response" =~ ^([1][eE][sS]|[1])$ ]]
then
    clear
    sed -ir "s/^[#]*\s*ram=.*/ram=512/" launch.properties
fi    

if [[ "$response" =~ ^([2][eE][sS]|[2])$ ]]
then 
    clear
    sed -ir "s/^[#]*\s*ram=.*/ram=1024/" launch.properties
fi

if [[ "$response" =~ ^([3][eE][sS]|[3])$ ]]
then 
    clear
    sed -ir "s/^[#]*\s*ram=.*/ram=2048/" launch.properties
fi