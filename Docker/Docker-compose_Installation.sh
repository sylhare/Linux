# Install Docker Compose
# https://docs.docker.com/compose/install/#prerequisites

# Download last version of Docker Compose (1.16.0)
curl -L https://github.com/docker/compose/releases/download/1.16.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# Make the file executable to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Uninstall Docker-Compose
# sudo rm /usr/local/bin/docker-compose
