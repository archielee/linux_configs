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

# Chrome
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Sublime
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

echo "[Updating the packages]"
sudo apt-get update

echo "[Installing the packages]"
sudo apt-get install -y vim arduino terminator openssh-server git vlc \
	indicator-multiload indicator-cpufreq screen sublime-text-installer google-chrome-stable

sudo apt-get -y purge thunderbird* pidgin* gwibber* rhythmbox* ubuntuone* empathy* totem*

sudo apt-get -y dist-upgrade

git config --global user.email "archie_lee7@hotmail.com"
git config --global user.name "Archie Lee"

# Make Sublime default
sudo sed -i.bak 's/gedit.desktop/sublime-text.desktop/g' /usr/share/applications/defaults.list
sudo sed -i.bak 's/gedit.desktop/sublime-text.desktop/g' /etc/gnome/defaults.list

# Install pip
wget -O ~/get-pip.py https://bootstrap.pypa.io/get-pip.py
sudo python3 ~/get-pip.py

# Add user to dialout
sudo adduser $USER dialout
echo "Added yourself to dialout, make sure to logout to take effect."
