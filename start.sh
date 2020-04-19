#!/bin/bash

source /opt/conda/bin/activate

conda run -n cling jupyter lab --port=8888 --ip=0.0.0.0 --allow-root
