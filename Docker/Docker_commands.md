# Docker commands

## Container

Create image using this directory's Dockerfile

    docker build -t friendlyname .  

Run "friendlyname" mapping port 4000 to 80

    docker run -p 4000:80 friendlyname  

Same thing, but in detached mode

    docker run -d -p 4000:80 friendlyname        

List all running containers
    
    docker container ls                

List all containers, even those not running

    docker container ls -a             
    
Gracefully stop the specified container    

    docker container stop <hash>           
    
Force shutdown of the specified container
 
 docker container kill <hash>   
 
Remove specified container from this machine

    docker container rm <hash>     

Remove all containers

    docker container rm $(docker container ls -a -q)     

List all images on this machine

    docker image ls -a                            

Remove specified image from this machine
    
    docker image rm <image id>            

Remove all images from this machine

    docker image rm $(docker image ls -a -q)  

Log in this CLI session using your Docker credentials

    docker login

Tag <image> for upload to registry
 
    docker tag <image> username/repository:tag 

Upload tagged image to registry

    docker push username/repository:tag            

Run image from a registry

    docker run username/repository:tag    

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

```bash
docker stack ls                                            # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker service ls                 # List running services associated with an app
docker service ps <service>                  # List tasks associated with an app
docker inspect <task or container>                   # Inspect task or container
docker container ls -q                                      # List container IDs
docker stack rm <appname>                             # Tear down an application
```

## Swarm

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