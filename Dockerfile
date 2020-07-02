FROM ubuntu:18.04
#FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

LABEL maintainer "Filippo Aleotti <filippo.aleotti2@unibo.it>"

SHELL ["/bin/bash", "-c"]

# install dependencies and tools
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libsuitesparse-dev libeigen3-dev libboost-all-dev \
    libopencv-dev cmake locales \
    build-essential \
    libgl1-mesa-dev libglew-dev cmake libpython2.7-dev pkg-config \
    libwayland-dev libxkbcommon-dev wayland-protocols libpng-dev \
    ffmpeg libavcodec-dev libavutil-dev libavformat-dev \
    libswscale-dev libavdevice-dev libjpeg-dev libtiff5-dev \
    libopenexr-dev git libglfw3-dev libgles2-mesa-dev libtiff-dev \
    libwebp-dev libgtk-3-dev python-dev python-numpy gcc g++


# copy DSO source files
COPY cmake ${PROJECT_ROOT}/dso/cmake/
COPY src ${PROJECT_ROOT}/dso/src/
COPY CMakeLists_global.txt ${PROJECT_ROOT}/dso/CMakeLists.txt
COPY thirdparty ${PROJECT_ROOT}/dso/thirdparty/

# install zlib1g
RUN apt-get install zlib1g-dev && \
    cd dso/thirdparty && \
    tar -zxvf libzip-1.1.1.tar.gz && \
    cd libzip-1.1.1/ && \
    ./configure && \
    make -j 4 && \
    make install && \
    cp lib/zipconf.h /usr/local/include/zipconf.h
RUN cd ../..

# install pangolin
RUN git clone https://github.com/stevenlovegrove/Pangolin.git && \
    cd Pangolin &&  \
    mkdir build && \
    cd build  && \
    cmake ..  && \
    cmake --build .
RUN cd ..

# build DSO
WORKDIR ${PROJECT_ROOT}/dso
RUN mkdir build && cd build && cmake .. && make -j8