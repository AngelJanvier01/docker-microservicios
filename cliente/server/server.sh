#!/bin/bash

PORT=80

fuser -k 80/tcp

cd build/web

python3 -m http.server $PORT