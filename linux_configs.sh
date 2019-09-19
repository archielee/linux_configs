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

echo "[Removing useless packages]"
sudo apt -y purge thunderbird* pidgin* gwibber* rhythmbox* ubuntuone* empathy* totem*

echo "[Updating the packages]"
sudo apt update

echo "[Installing the packages]"
sudo apt install -y vim terminator openssh-server git vlc python3-pip \
	indicator-multiload indicator-cpufreq screen

sudo apt -y dist-upgrade

git config --global user.email "archie_lee7@hotmail.com"
git config --global user.name "Archie Lee"

# Make VSCode default
# sudo update-alternatives --set editor /usr/bin/code
