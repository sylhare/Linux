# Docker Uninstallation
# Ubuntu v17.04 or 16.04
#
####################
# Uninstall docker CE #
###################

sudo apt-get purge docker-ce

#Remove all containers and images
sudo rm -rf /var/lib/docker
