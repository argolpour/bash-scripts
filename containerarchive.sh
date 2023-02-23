#!/bin/bash

# Get a list of running container IDs
containers=$(docker ps -q)

# Check if there are any running containers
if [[ -z "$containers" ]]; then
    echo "There are no running containers to commit."
    exit 1
fi

# Create a directory to store the container images
mkdir -p container_images

# Commit each running container and save the image as a tar file
for container in $containers; do
    image=$(docker ps --format '{{.Image}}' --filter "id=$container")
    timestamp=$(date +%Y%m%d-%H%M%S)
    filename="$image-$timestamp.tar"
    docker commit $container $image
    docker save $image -o container_images/$filename
done

# Create a tar file containing all the container images
tar -czvf container_images.tar.gz container_images/

# Remove the directory with the container images
rm -rf container_images/

