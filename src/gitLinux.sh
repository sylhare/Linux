#!bin/bash
# Ubuntu v16 - 64bits

echo -e "\n--------------------------\n"
echo "Github Sylhare/Linux set up"
echo -e "\n--------------------------\n"

#Install git 
echo -e "\n Checking if git is installed \n"
sudo apt-get install git

filename="~/.gitconfig"
repo="~/Documents/Linux"


echo "\n"

#Adding some default config, if there's no config file
if [ ! -f "$filename" ]
then
    echo "$0: File $file not found, no config"
    git --globale user.name "Sylhare"
else
    echo -e "\n \n Existing config has been used \n"
fi

# Checking if the Linux Repo has been cloned or update it
if [ ! -d "$repo" ]
then
    echo "$0: Repo $repo not found, repository will be cloned"
    git clone https://github.com/Sylhare/Linux.git ~/Documents
else
    #git status	
    # Save your change in a stash before pulling
    git stash
    git pull https://github.com/Sylhare/Linux.git 
    git stash pop

fi

# If there is a conflict and you want to keep a file from the stash
#git checkout --theirs -- filetosave.txt

exit 0

