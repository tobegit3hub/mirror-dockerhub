# Mirror Dockerhub

## Introduction

Mirror-dockerhub is the tool to mirror container images from docker hub.

You can mirror images from not only docker hub but also other private registries.

## Usage

```
./mirror.sh
```

## Configuration

You can configure the repo, source and destination registries in `mirror.sh`.

```
filename="repo.conf"
#filename="repo_dockerhub.conf"

source_registry=""
#source_registry="index.alauda.cn/library/"

destination_registry="127.0.0.1:5000/"
#destination_registry="42.62.101.165:5000/"
```

