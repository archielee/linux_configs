#!/bin/bash

# Turn off "Remote Search", so search terms in Dash don't get sent to the internet
gsettings set com.canonical.Unity.Lenses remote-content-search none
# If you're using a later version, disable remote scopes
gsettings set com.canonical.Unity.Lenses disabled-scopes \
      "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope',
      'more_suggestions-populartracks.scope', 'music-musicstore.scope',
      'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope',
      'more_suggestions-skimlinks.scope']"
echo "All done. Enjoy your privacy."

# VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

echo "[Removing useless packages]"
sudo apt -y purge thunderbird* pidgin* gwibber* rhythmbox* ubuntuone* empathy* totem*

echo "[Updating the packages]"
sudo apt update

echo "[Installing the packages]"
sudo apt install -y vim terminator openssh-server git vlc python3-pip \
	indicator-multiload indicator-cpufreq screen apt-transport-https code

sudo apt -y dist-upgrade

git config --global user.email "archie_lee7@hotmail.com"
git config --global user.name "Archie Lee"

# Make VSCode default
sudo update-alternatives --set editor /usr/bin/code
