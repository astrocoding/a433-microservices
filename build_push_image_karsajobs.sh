#!/bin/bash

# Variabel untuk username dan token
GITHUB_USERNAME=astrocoding

# Build Docker image
docker build -t ${GITHUB_USERNAME}/karsajobs:latest .

# Login ke GitHub Container Registry
echo $GHCR_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Tag Docker image
docker tag ${GITHUB_USERNAME}/karsajobs:latest ghcr.io/${GITHUB_USERNAME}/karsajobs:latest

# Push Docker image ke GitHub Container Registry
docker push ghcr.io/${GITHUB_USERNAME}/karsajobs:latest
