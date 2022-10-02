#!/bin/bash

docker stop ubuntu_tools
docker image rm -f ubuntu_tools_image
cat /dev/null > ~/.ssh/known_hosts
docker build . -t ubuntu_tools_image
docker run -p 3000:22 --network ubuntu --name ubuntu_tools --cap-add LINUX_IMMUTABLE --rm -d ubuntu_tools_image