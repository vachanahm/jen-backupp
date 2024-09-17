#!/bin/bash


JENKINS_DIR="/var/lib/jenkins"
BACKUP_REPO="/home/ubuntu/jenkins-learning/jen-backupp "   # Local path to the Git repository


TIMESTAMP=$(date +"%Y-%m-%d")


cd $BACKUP_REPO


 sudo cp -r  $JENKINS_DIR/* $BACKUP_REPO/


git add .


git commit -m "Daily Jenkins backup - $TIMESTAMP"


git push origin main  



