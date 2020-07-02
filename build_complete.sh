#!/bin/bash
set -e 
BUILD_DIR="build"
THIRDPARTY="thirdparty"
LIB_FOLDER="install"

if [ -d "$BUILD_DIR" ]; then rm -Rf "$BUILD_DIR"; fi
mkdir -p $THIRDPARTY

sudo apt-get install libsuitesparse-dev libeigen3-dev libboost-all-dev
sudo apt-get install libopencv-dev
sudo apt-get install git
sudo apt-get install cmake
sudo apt-get install libgtk2.0-dev

bash $LIB_FOLDER/build_pangolin.sh
#bash $LIB_FOLDER/build_ziplib.sh
bash $LIB_FOLDER/build_opencv.sh

bash build_dso.sh
