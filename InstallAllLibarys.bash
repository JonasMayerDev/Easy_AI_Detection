#!/bin/bash

gedit README.md&

echo were do you you store your Images? Relative path is possible..

read imgPath

echo what pretrained model do you want to download? \n[1] Realy fast but less accurat\n[2] Fast but #more accurat\n[3] Slow but more accurat\n[4] Realy slow but realy accurat


#read model

model=2

PKGS=(python3-pip pyqt5-dev-tools python3 git python-tk python-lxml python-pil protobuf-compiler)
  
echo Check if Everything reqired is installed


for ((i=0 ;i < ${#PKGS[@]};i++))
do
    
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ${PKGS[$i]} |grep "install ok installed") 
    echo Checking for ${PKGS[$i]}: $PKG_OK
    if [ "" == "${PKG_OK}" ]; then
    echo "Package is not installed. Install: ${PKGS[$i]}"
    sudo apt-get --force-yes --yes install ${PKGS[$i]}
    fi
    
done


DIR="models"
if ! [ -d "$DIR" ]; then
    echo Install models 
    git clone https://github.com/tensorflow/models.git
    cd models/research
    python3 setup.py install
    cd ../..
fi
DIR="models/research/object_detection/labelImg"
if ! [ -d "$DIR" ]; then
    cd models/research/object_detection/
    echo Install labelImg Programm
    git clone https://github.com/tzutalin/labelImg.git
    cd ../../..
fi
DIR="models/research/bin"
if ! [ -d "$DIR" ]; then
    echo Install protobuf Programm
    cd models
    cd research
    wget -O protobuf.zip https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip
    unzip protobuf.zip
    ./bin/protoc object_detection/protos/*.proto --python_out=.
    #sudo python3 setup.py install
    cd ../..

fi



echo \n Check if all python libarys are installed...

sudo pip3 install lxml
sudo pip3 install tensorflow
sudo pip3 install Cython
sudo pip3 install contextlib2
sudo pip3 install jupyter
sudo pip3 install matplotlib
sudo pip3 install pandas


cd models/research/object_detection

if [ "$model" == 1 ]; then
    export CONFIG=ssd_mobilenet_v1_depth.config
    wget http://download.tensorflow.org/models/object_detection/		                      ssd_mobilenet_v1_0.75_depth_300x300_coco14_sync_2018_07_03.tar.gz
    tar -xzvf ssd_mobilenet_v1_0.75_depth_300x300_coco14_sync_2018_07_03.tar.gz
    cp ../../../ssd_mobilenet_v1_depth.config .
    gedit `printenv CONFIG`
elif [ "$model" == 2 ]; then
    export CONFIG=ssd_mobilenet_v1_fpn.config
    wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_fpn_shared_box_predictor_640x640_coco14_sync_2018_07_03.tar.gz
    tar -xzvf ssd_mobilenet_v1_fpn_shared_box_predictor_640x640_coco14_sync_2018_07_03.tar.gz
    cp ../../../ssd_mobilenet_v1_fpn.config .
    gedit `printenv CONFIG`
elif ("$model"==3)then
    wget http://download.tensorflow.org/models/object_detection/faster_rcnn_inception_resnet_v2_atrous_coco_2018_01_28.tar.gz
    tar -xzvf faster_rcnn_inception_resnet_v2_atrous_coco_2018_01_28.tar.gz
    cp ../../../rcnn_inception_resnet_v2_atrous.config .
elif ("$model"==3)then
    wget http://download.tensorflow.org/models/object_detection/faster_rcnn_nas_coco_2018_01_28.tar.gz
    tar -xzvf faster_rcnn_nas_coco_2018_01_28.tar.gz
    cp ../../../faster_rcnn_nas_coco.config .
fi
cd ../../..
echo Everything is Secessfull istalled

echo Starting labeling

. StartLabeling.bash "$imgPath"

echo Starting Converting

. ConvertingFiles.bash

echo Starting training

. startTraining.bash `printenv CONFIG`


