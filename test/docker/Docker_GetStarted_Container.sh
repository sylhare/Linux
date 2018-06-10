# Construct the container with:
# -t hello to name the container hello
# /path/to/file because sometime it does not work when launcher from the same repository
sudo docker build -t hello /path/to/files

# See the available images in the system
sudo docker images

# Running the app
# d specify in the background and get a container ID
# p specify the port
sudo docker run -d -p 4000:80 hello

# See your container IDs
docker container ls

# the container says the service is available at http://0.0.0.0:80
# But from the host side, the real address is http://localhost:4000
# To see it in browser
python -mwebbrowser http://localhost:4000

# With curl to get the web page
curl http://localhost:4000

# ctrl + c to stop the container
# Or if run in the background, replace containerID by the one of your container
sudo docker stop _containerID_

### Share your container ###
# Sign up in https://cloud.docker.com/ and log in with
docker login

# Save your container
# get-started is the repository (that will be created automatically)
# part2 is a tag, common practice with docker
sudo docker tag hello sylhare/get-started:part2

# Make sure your container has been saved, it should appear with
sudo docker image ls

# Push (upload) your container on https://cloud.docker.com/ 
sudo docker push sylhare/get-started:part2

# Run an image from the docker cloud:
sudo docker run -p 4000:80 sylhare/get-started:part2

# Delete an image, replace the <image ID> by the ID of an image
sudo docker images ls
sudo docker image rm <image id>
