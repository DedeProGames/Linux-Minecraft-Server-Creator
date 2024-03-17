read -r -p "
Server Settings
1) Change Gamemode
2) Create World
3) Change Difficulty
4) Exit
Choose a Number from 1 to 4.
> " response
if [[ "$response" =~ ^([1][eE][sS]|[1])$ ]]
then
    clear
    bash gamemode.sh
fi    

if [[ "$response" =~ ^([2][eE][sS]|[2])$ ]]
then
    clear
    cd Server
    echo -e "\e[1;33mDo you really want to create another World? [Warning: Current World will be deleted]\e[0m"
    echo "Press Enter to Continue"
    echo "Press Ctrl-C to Cancell"
    read -s agree_text
    echo "=============================="
    echo "Preparing to Delete Worlds"
    echo "Deleting World | 1/3"
    rm -rf world
    echo "Deleted World 1/3"
    echo "=============================="
    echo "Deleting World | 2/3"
    rm -rf world_nether
    echo "Deleted World 2/3"
    echo "=============================="
    echo "Deleting World | 3/3"
    rm -rf world_the_end
    echo "Deleted World 3/3"
    echo "=============================="
    echo -e "\e[1;34mAll Worlds have been Deleted\e[0m"
    echo "=============================="
    echo "Preparing to Create World Files:"
    echo "Creating World | 1/3"
    mkdir world
    echo "Created World 1/3"
    echo "=============================="
    echo "Creating World | 2/3"
    mkdir world_nether
    echo "Created World 2/3"
    echo "=============================="
    echo "Creating World | 3/3"
    mkdir world_the_end
    echo "Created World 3/3"
    echo "=============================="
    echo -e "\e[1;34mAll Worlds have been Created\e[0m"
    echo "=============================="
    echo -e "\e[1;32mLaunching Main Screen\e[0m"
    clear
    cd ..
    bash settings.sh

fi

if [[ "$response" =~ ^([3][eE][sS]|[3])$ ]]
then
    clear
    bash difficulty.sh
fi


if [[ "$response" =~ ^([4][eE][sS]|[3])$ ]]
then
    clear
    bash main.sh
fi
