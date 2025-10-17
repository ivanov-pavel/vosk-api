#!/bin/bash

set -e -x 
docker build --file travis/Dockerfile.win --tag alphacep/kaldi-win:latest .
docker run --rm -v `realpath ..`:/io alphacep/kaldi-win /io/travis/build-wheels-win.sh
