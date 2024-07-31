#!/bin/bash

# Build Docker image
docker build -t astrocoding/karsajobs:latest .

# Login to GitHub Packages
echo $GITHUB_TOKEN | docker login ghcr.io -u astrocoding --password-stdin

# Push Docker image
docker push ghcr.io/astrocoding/karsajobs:latest
