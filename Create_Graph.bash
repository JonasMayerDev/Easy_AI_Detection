#!/bin/bash
python3 models/research/object_detection/export_inference_graph.py \
    --input_type image_tensor \
    --pipeline_config_path `pwd`/models/research/object_detection/`printenv CONFIG` \
    --trained_checkpoint_prefix `pwd`/models/research/object_detection/training/model.ckpt-$1 \
    --output_directory `pwd`/models/research/object_detection/output/

