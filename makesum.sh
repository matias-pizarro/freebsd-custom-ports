#!/usr/bin/env bash

basepath=/usr/local/poudriere/ports/main/mpizarro

cd ${basepath};
for package in $(\ls -d *-devel | grep -v lumina-devel) linux-bcompare; do
    # package=$(basename ${path})
    cd ${basepath}/${package};
    sudo make makesum;
    # echo ${package};
done;

cd ${basepath};
