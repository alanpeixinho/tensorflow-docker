from nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

run apt-get update -y &&  apt-get install -y unzip libhdf5-dev libhdf5-serial-dev python3-h5py wget unzip zip python3 python3-dev python3-pip && rm -rf /var/lib/apt/lists
run pip3 install --upgrade pip
run pip3 install tensorflow-gpu==1.15.2  numpy==1.15.2 protobuf==3.6.1 six wheel mock Keras-Applications==1.0.8 Keras-Preprocessing==1.1.0

