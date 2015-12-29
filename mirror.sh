#!/bin/bash

set -x

# Configure these parameters
filename="repo.conf"
#source_registry=""
source_registry="index.alauda.cn/library/"
#destination_registry="127.0.0.1:5000/"
destination_registry="42.62.101.165:5000/"

# Read file to pull images
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Start to pull/tag/push/rmi the image: $line"

    # Example: docker pull index.alauda.cn/library/redmine
    docker pull "$source_registry$line"

    # Example: docker tag centos 42.62.101.165:5000/centos
    docker tag "$source_registry$line" "$destination_registry$line"

    # Example: docker push 42.62.101.165:5000/java:8
    docker push "$destination_registry$line"

    # Example: docker rmi 42.62.101.165:5000/centos
    docker rmi "$destination_registry$line"

    # Read file to determine if we want to buffer images locally
    if grep -Fxq $line save.conf
    then
        echo "The image $line will be saved locally"
    else
        echo "Remove the image $line from local"
        # Example: docker rmi index.alauda.cn/library/redmine
        docker rmi "$source_registry$line"
    fi

done < "$filename"

