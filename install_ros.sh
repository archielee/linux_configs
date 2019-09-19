#!/bin/bash

echo "Installing ROS Kinetic"

# Add sources and keys
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

# Install ROS
sudo apt update
sudo apt install -y ros-kinetic-desktop-full
sudo rosdep init
rosdep update

# Update ~/.bashrc
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install rosinstall
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools
