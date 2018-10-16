#!/bin/bash
set -ex

COMPANY=ViktorSalimonov
IMAGE=peterbot

echo "$PWD"
# bump version
#docker run --rm -v "$PWD":/app $COMPANY/$IMAGE patch
version=`cat VERSION`
echo "version: $version"
# run build
./build.sh
# tag it
#git add -A
#git commit -m "version $version"
#git tag -a "$version" -m "version $version"
#git push
#git push --tags
#docker tag $COMPANY/$IMAGE:latest $COMPANY/$IMAGE:$version
# push it
#docker push $COMPANY/$IMAGE:latest
#docker push $COMPANY/$IMAGE:$version
