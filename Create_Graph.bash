#!/bin/bash
python3 models/research/object_detection/export_inference_graph.py \
    --input_type image_tensor \
    --pipeline_config_path `pwd`/models/research/object_detection/`printenv CONFIG` \
    --trained_checkpoint_prefix `pwd`/models/research/object_detection/training/model.ckpt-$1 \
    --output_directory `pwd`/models/research/object_detection/output/

cp models/research/object_detection/protos /usr/local/lib/python3.5/dist-packages/object_detection-0.1-py3.5.egg/object_detection/protos

