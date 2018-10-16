#!/bin/bash

cd ./peterbot
make clean
cd ../

set -ex

COMPANY=ViktorSalimonov
IMAGE=peterbot

docker build -t $COMPANY/$IMAGE:latest .
