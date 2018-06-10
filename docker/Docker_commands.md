# Docker commands

A little overview of the Docker, following some tutorial and Docs from the [official website](https://docs.docker.com/get-started)

## Container

### Introduction

A **container** is a runtime instance of an image—what the image becomes in memory when actually executed. It runs completely isolated from the host environment by default, only accessing host files and ports if configured to do so.

Containers can share a single kernel, and the only information that needs to be in a container image is the executable and its package dependencies, which never need to be installed on the host system

### Getting Started

Dockerfile, app.py and requirements.txt are stored in the Docker folder to try this out.

Create the docker file, app.py and requirements.txt
Construct the container with:
```bash
# -t hello to name the container hello
# /path/to/file because sometime it does not work when launcher from the same repository
sudo docker build -t hello /path/to/files
```

See the available images in the system

    sudo docker images

Running the app
```bash
# d specify in the background and get a container ID
# p specify the port
sudo docker run -d -p 4000:80 hello
```

See your container IDs

    docker container ls

the container says the service is available at `http://0.0.0.0:80` but from the host side, the real address is `http://localhost:4000`

To see it in browser

    python -mwebbrowser http://localhost:4000

With curl to get the web page

    curl http://localhost:4000

Use ctrl + c to stop the container, or if run in the background, replace `containerID` by the one of your container

    sudo docker stop _containerID_

### Share your container

Sign up in https://cloud.docker.com/ and log in with

    docker login

Save your container
```bash
# get-started is the repository (that will be created automatically)
# part2 is a tag, common practice with docker
sudo docker tag hello sylhare/get-started:part2
```

Make sure your container has been saved, it should appear with

    sudo docker image ls

Push (upload) your container on [Docker Cloud](https://cloud.docker.com/)

    sudo docker push sylhare/get-started:part2

Run an image from the docker cloud:

    sudo docker run -p 4000:80 sylhare/get-started:part2

Delete an image, replace the `<image ID>` by the ID of an image

    sudo docker images ls
    sudo docker image rm <image id>
    
You can find my container at [docker.com/sylhare/get-started](https://store.docker.com/community/images/sylhare/get-started)

### Default Containers commandes

To recap, while typing docker run is simple enough, the true implementation of a container in production is running it as a service. 

Services codify a container’s behavior in a Compose file, and this file can be used to scale, limit, and redeploy our app. 

Changes to the service can be applied in place, as it runs, using the same command that launched the service: docker stack deploy


```bash
docker build -t friendlyname .  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyname  # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyname         # Same thing, but in detached mode
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
docker login             # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag                   # Run image from a registry
```

## Services

Services are really just “containers in production.” A service only runs one image, but it codifies the way that image runs—what ports it should use, how many replicas of the container should run so the service has the capacity it needs, and so on.

A docker-compose.yml file is a YAML file that defines how Docker containers should behave in production.


```bash
docker service ls                 # List running services associated with an app
docker service ps <service>                  # List tasks associated with an app
docker inspect <task or container>                   # Inspect task or container
docker container ls -q                                      # List container IDs
```

## Swarm

A **swarm** is a group of machines that are running Docker and joined into a cluster. 

After that has happened, you continue to run the Docker commands you’re used to, but now they are executed on a cluster by a swarm manager. The machines in a swarm can be physical or virtual. 

After joining a swarm, they are referred to as **nodes**.

Initialise the swarm, makes the node as a swarm manager
    
    docker swarm init

In the repository where the docker files are, deploy the stack with “getstartedlab” ad the name
If you make a change to docker-compose.yml re-runing this command will update your swarm

    docker stack deploy -c docker-compose.yml getstartedlab

Get the ID of our service running in our application

    docker service ls

Check the status of a service based on the ID, replace _serviceID_ by the correct one

    docker service ps _serviceID_

List all of the container (-q is to get only the ID)

    docker container ls -q

Take down the app

    docker stack rm getstartedlab

List all the node

    docker node ls
    
Delete the swarm node leader created at the 
beginning

    docker swarm leave --force


Swarm managers are the only machines in a swarm that can execute your commands, or authorize other machines to join the swarm as workers. Workers are just there to provide capacity and do not have the authority to tell any other machine what it can and cannot do.


```bash
docker-machine create --driver virtualbox myvm1 # Create a VM (Mac, Win7, Linux)
docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm1 # Win10
docker-machine env myvm1                # View basic information about your node
docker-machine ssh myvm1 "docker node ls"         # List the nodes in your swarm
docker-machine ssh myvm1 "docker node inspect <node ID>"        # Inspect a node
docker-machine ssh myvm1 "docker swarm join-token -q worker"   # View join token
docker-machine ssh myvm1   # Open an SSH session with the VM; type "exit" to end
docker-machine ssh myvm2 "docker swarm leave"  # Make the worker leave the swarm
docker-machine ssh myvm1 "docker swarm leave -f" # Make master leave, kill swarm
docker-machine start myvm1            # Start a VM that is currently not running
docker-machine stop $(docker-machine ls -q)               # Stop all running VMs
docker-machine rm $(docker-machine ls -q) # Delete all VMs and their disk images
docker-machine scp docker-compose.yml myvm1:~     # Copy file to node's home dir
docker-machine ssh myvm1 "docker stack deploy -c <file> <app>"   # Deploy an app
```

## Stacks

Stacks are inter-related services all running in concert. A stack is a group of interrelated services that share dependencies, and can be orchestrated and scaled together. 

To add more services to your stack, you insert them in your [Compose](https://docs.docker.com/compose/) file.

Using a combination of placement constraints and volumes you can create a permanent home for persisting data, so that your app’s data survives when the container is torn down and redeployed

```bash
docker stack ls                                            # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker stack rm <appname>                             # Tear down an application
```