#!/bin/bash
set -e;

mkdir build;
cd build;
cmake -DWITH_CUDA=OFF -DWITH_PYTORCH=ON -DCMAKE_BUILD_TYPE=DEBUG ..;
make VERBOSE=1;

cd pytorch;
python setup.py bdist_wheel;
pip install $(find dist/ -name "*.whl");
