#!/usr/bin/env bash
if [[ $# -ne 0 ]];then
  ARCH=$1
else
  ARCH=amd64
fi
for name in scan store;do
  docker build --build-arg ARCH=$ARCH -t homeiot_${name} ./docker/${name}
  docker tag homeiot_${name} localhost:5000/homeiot_${name}
  docker push localhost:5000/homeiot_${name}
done