# Contstruct image tagged (-t) as hello from the example-app folder
docker build -t hello example-app

# See the available images in the system
docker images

# Running the app
# d specify in the background and get a container ID
# p specify the port
docker run -d -p 4000:80 hello

# See your container IDs
docker container ls

# the container says the service is available at http://0.0.0.0:80
# But from the host side, the real address is http://localhost:4000
# To see it in browser
python -mwebbrowser http://localhost:4000

# With curl to get the web page
curl http://localhost:4000
