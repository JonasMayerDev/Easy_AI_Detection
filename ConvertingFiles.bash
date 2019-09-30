#!/bin/bash

export PYTHONPATH=$PYTHONPATH:`pwd`/models/research:`pwd`/models/research/slim

python3 xml_to_csv.py
gedit generate_tfrecord.py

python3 -W ignore generate_tfrecord.py --csv_input=models/research/object_detection/detect_data/train.csv  --output_path=models/research/object_detection/detect_data/train.record --image_dir=models/research/object_detection/train/
python3 -W ignore generate_tfrecord.py --csv_input=models/research/object_detection/detect_data/test.csv  --output_path=models/research/object_detection/detect_data/test.record --image_dir=models/research/object_detection/test/
