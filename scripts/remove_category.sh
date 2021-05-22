#!/usr/bin/env bash

basepath=/usr/local/poudriere/ports/main/mpizarro

find ${basepath} -name "Makefile" -exec sed -i '' -E 's|CATEGORIES=([\t ]*)mpizarro |CATEGORIES=\1|' {} +
