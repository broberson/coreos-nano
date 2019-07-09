#!/bin/bash
docker build -t broberson/coreos-nano:2.9.8 .
docker run --name coreos-nano -v "$(pwd)/:/media/root" broberson/coreos-nano:2.9.8
docker rm coreos-nano
docker rmi broberson/coreos-nano:2.9.8
