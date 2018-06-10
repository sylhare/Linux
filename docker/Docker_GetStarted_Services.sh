# Initialise the swarm, makes the node as a swarm manager
docker swarm init

# In the repository where the docker files are, deploy the stack with “getstartedlab” ad the name
# If you make a change to docker-compose.yml re-runing this command will update your swarm
docker stack deploy -c docker-compose.yml getstartedlab

# Get the ID of our service running in our application
docker service ls

# Check the status of a service based on the ID, replace _serviceID_ by the correct one
docker service ps _serviceID_

# List all of the container (-q is to get only the ID)
docker container ls -q

# Take down the app
docker stack rm getstartedlab

# List all the node
docker node ls
# Delete the swarm node leader created at the beginning
docker swarm leave --force
