#!/usr/bin/env bash

# build docker image
docker build -t copernicusmarine:latest copernicusmarine_docker

# build sif file
docker pull kathoef/docker2singularity:latest
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro -v "${PWD}":/output \
  kathoef/docker2singularity singularity build copernicusmarine_latest.sif \
  docker-daemon://copernicusmarine:latest
