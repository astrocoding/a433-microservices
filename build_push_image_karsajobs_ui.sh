#!/bin/bash

# Variabel untuk username dan token
GITHUB_USERNAME=astrocoding
PACKAGE_NAME=$GITHUB_USERNAME/karsajobs-ui:latest
IMAGE_NAME=ghcr.io/$PACKAGE_NAME

# Membangun image Docker
echo -e "Building Docker image:"
docker build -t $PACKAGE_NAME .

# Login ke GitHub Container Registry
echo -e "\nLogin into GitHub Container Registry:"
echo $GHCR_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Mengubah nama image agar sesuai dengan format GitHub Container Registry
docker tag $PACKAGE_NAME $IMAGE_NAME

# Melihat daftar image di lokal
echo -e "\nList of Docker images:"
docker images

# Mengunggah image ke GitHub Container Registry
echo -e "\nPublishing image to GitHub Container Registry:"
docker push $IMAGE_NAME

echo 'Docker image build, tag, and push completed successfully.'
