#!/bin/bash

# Define the backup directory and Git repository
JENKINS_DIR="/var/lib/jenkins"
BACKUP_REPO="/home/ubuntu/jenkins-learning/jen-backupp "   # Local path to the Git repository

# Create a timestamp for the backup
TIMESTAMP=$(date +"%Y-%m-%d")

# Navigate to the backup repository
cd $BACKUP_REPO

# Copy the contents of the Jenkins directory
sudo rsync -av --delete $JENKINS_DIR/* $BACKUP_REPO/

# Add any new or updated files to the repository
git add .

# Commit the changes with a timestamp message
git commit -m "Daily Jenkins backup - $TIMESTAMP"

# Push the changes to the remote repository
git push origin main  # Adjust 'main' based on your branch

# Log the backup status (optional)
echo "Backup completed on $TIMESTAMP" >> /var/log/jenkins_backup.log

