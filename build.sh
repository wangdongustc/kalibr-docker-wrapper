#!/bin/bash

echo "Building docker image ... "

docker build --tag kalibr .

# uncomment this if proxy is needed
# docker build --tag kalibr . \
#  --build-arg "HTTP_PROXY=http://127.0.0.1:6666/" \
#  --build-arg "HTTPS_PROXY=http://127.0.0.1:6666/" \
#  --build-arg "NO_PROXY=localhost,127.0.0.1,.example.com" \
#  --network host
echo "Done."
