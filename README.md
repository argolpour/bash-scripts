# bash-scriptsThis script first gets a list of running container IDs using the docker ps -q command. If there are no running containers, the script exits with an error message. Otherwise, it creates a directory called container_images to store the container images.

Next, it iterates over the list of running containers and commits each container using the docker commit command. It also saves the image as a tar file using the docker save command and names the file based on the container image and the current timestamp.

After all the containers have been committed and saved, the script creates a tar file called container_images.tar.gz that contains all the tar files created in the previous step. Finally, it removes the container_images directory to clean up.
