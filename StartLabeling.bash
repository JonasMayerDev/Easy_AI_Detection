#!/bin/bash

cd models/research/object_detection/labelImg
make qt5py3
cd ..

mkdir test
mkdir train
mkdir detect_data

cd ../../..
python3 Aufteilen.py $1
cd models/research/object_detection


cd labelImg
python3 labelImg.py 
cd ../../../..


