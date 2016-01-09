#!/bin/bash

docker run -d -p 5000:5000 --restart=always -v /var/lib/docker/images:/var/lib/registry --name registry registry:2
