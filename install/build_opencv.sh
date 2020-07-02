#!bin/bash

#sudo apt-get install cmake
#sudo apt-get install gcc g++
#sudo apt-get install python-dev python-numpy
#sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev
#sudo apt-get install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
#sudo apt-get install libgtk-3-dev
#sudo apt-get install libpng-dev
#sudo apt-get install libjpeg-dev
#sudo apt-get install libopenexr-dev
#sudo apt-get install libtiff-dev
#sudo apt-get install libwebp-dev

#sudo apt-get install git

PROJ_DIR=$PWD

mkdir -p cv_build
cd cv_build

git clone https://github.com/opencv/opencv.git -b 3.4
mkdir -p opencv/build
cd opencv/build
cmake -DCMAKE_INSTALL_PREFIX=$PROJ_DIR/thirdparty/opencv ../

make -j 8
sudo make install