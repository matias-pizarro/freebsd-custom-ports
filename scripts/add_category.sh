#!/usr/bin/env bash

basepath=/usr/local/poudriere/ports/main/mpizarro

cd ${basepath};
for package in $(\ls -d *-devel | grep -v lumina-devel) linux-*; do
    sed -i '' 's|CATEGORIES=|CATEGORIES=	mpizarro|' ${basepath}/${package}/Makefile;
done;

cd ${basepath};
