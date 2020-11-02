#!/bin/bash

set -e

TOP_DIR=`pwd`

TAG=$1
if [ "x$TAG" = "x" ]; then
    TAG=dev
fi

cd $TOP_DIR/panopticon && \
    docker build -t opensciencegrid/open-pool-display-panopticon:$TAG .

cd $TOP_DIR/web && \
    docker build -t opensciencegrid/open-pool-display-web:$TAG .

