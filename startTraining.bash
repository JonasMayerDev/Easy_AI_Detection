#!/bin/bash

cd models/research

export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

./bin/protoc object_detection/protos/*.proto --python_out=.

cd object_detection

mkdir training
cd training

touch object-detection.pbtxt

gedit object-detection.pbtxt

cd ..

python3 -W ignore legacy/train.py --logtostderr --train_dir=`pwd`/training --pipeline_config_path=`pwd`/"$1" 

cd ../../..




