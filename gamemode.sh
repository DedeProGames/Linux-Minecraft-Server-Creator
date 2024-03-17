read -r -p "
Set Gamemode to:
1) Survival
2) Creative
3) Exit
Choose a Number from 1 to 3.
> " response
if [[ "$response" =~ ^([1][eE][sS]|[1])$ ]]
then
    clear
    cd Server
    sed -ir "s/^[#]*\s*gamemode=.*/gamemode=survival/" server.properties
    cd ..
fi    

if [[ "$response" =~ ^([2][eE][sS]|[2])$ ]]
then
    cd Server
    sed -ir "s/^[#]*\s*gamemode=.*/gamemode=creative/" server.properties
    echo Gamemode have been Changed
    cd ..
fi

if [[ "$response" =~ ^([3][eE][sS]|[3])$ ]]
then
    clear

fi

bash settings.sh