#!/bin/bash

set -ex

DIRNAME=$(dirname `realpath $0`);

echo "build static snappy"
cd $DIRNAME/snappy && cmake .
cd $DIRNAME/snappy && make

cd $DIRNAME && hphpize
cd $DIRNAME && cmake -Wno-dev .
cd $DIRNAME && make
