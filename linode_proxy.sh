#/bin/bash

while [ 1 ]
do
    ssh -t -t -g -C -N -D 8038 zyj@zhangyangjing.com
    sleep 1
done
