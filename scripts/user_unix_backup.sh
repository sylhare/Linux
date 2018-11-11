#!/bin/bash  

# Backup script for user repository
# Create a tarball of home/ in var/backups with the date of the backup

SRCD="/home/"
TGTD="/var/backups/"
OF=home-$(date +%Y%m%d).tgz
tar -cZf $TGTD$OF $SRCD