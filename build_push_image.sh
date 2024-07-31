#!/bin/bash

# Membuat Docker image dari Dockerfile dengan nama image item-app dan tag v1
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag item-app:v1 ghcr.io/astrocoding/item-app:v1

# Login ke GitHub Packages via Terminal
echo $GITHUB_TOKEN | docker login ghcr.io -u astrocoding --password-stdin

# Mengunggah image ke GitHub Packages
docker push ghcr.io/astrocoding/item-app:v1
