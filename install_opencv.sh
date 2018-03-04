#!/bin/bash

while true; do
    read -p "This installs OpenCV and virtualenv. Do you want to continue? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Update system and install build tools
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential \
                     cmake \
                     pkg-config \
                     libgtk2.0-dev \
                     libavcodec-dev \
                     libavformat-dev \
                     libswscale-dev

# Install virtual environment
sudo pip3 install virtualenv virtualenvwrapper
echo "# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

# Make virtual environment
mkvirtualenv cv

# Set up Python
sudo apt-get install python3.4-dev
pip3 install numpy

# Install and build OpenCV
OPENCV_VERSION=3.4.1
wget -O ~/opencv-$OPENCV_VERSION.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip
unzip ~/opencv-$OPENCV_VERSION.zip
wget -O ~/opencv_contrib-$OPENCV_VERSION.zip https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip
unzip ~/opencv_contrib-$OPENCV_VERSION.zip
cd ~/opencv-$OPENCV_VERSION
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=OFF \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
	-D BUILD_EXAMPLES=OFF \
        -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-$OPENCV_VERSION/modules ..
make -j4
sudo make install
sudo ldconfig

# Add symlinks
ln -s /usr/local/lib/python3.4/site-packages/cv2.cpython-34m.so ~/.virtualenvs/cv/lib/python3.4/site-packages/cv2.so
