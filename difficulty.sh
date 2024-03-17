read -r -p "
Set difficulty to:
1) Peaceful
2) Easy
3) Normal
3) Hard
3) Exit
Choose a Number from 1 to 5.
> " response
if [[ "$response" =~ ^([1][eE][sS]|[1])$ ]]
then
    cd Server
    sed -ir "s/^[#]*\s*difficulty=.*/difficulty=Peaceful/" server.properties
    echo difficulty have been Changed
    cd ..
fi    

if [[ "$response" =~ ^([2][eE][sS]|[2])$ ]]
then
    cd Server
    sed -ir "s/^[#]*\s*difficulty=.*/difficulty=Easy/" server.properties
    echo difficulty have been Changed
    cd ..
fi

if [[ "$response" =~ ^([3][eE][sS]|[2])$ ]]
then
    cd Server
    sed -ir "s/^[#]*\s*difficulty=.*/difficulty=Normal/" server.properties
    echo difficulty have been Changed
    cd ..
fi

if [[ "$response" =~ ^([4][eE][sS]|[2])$ ]]
then
    cd Server
    sed -ir "s/^[#]*\s*difficulty=.*/difficulty=Hard/" server.properties
    echo difficulty have been Changed
    cd ..
fi

if [[ "$response" =~ ^([5][eE][sS]|[3])$ ]]
then
    clear

fi
clear
bash settings.sh