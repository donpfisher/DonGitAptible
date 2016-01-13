#!/bin/bash
#Test: setup to configure HealthPals-api to run in Aptible docker
#
# Maintainer: Donald Fisher
# This script is used to provision a Docker on Aptible's github.  
# The difference between the master code base and Aptible's is the Procfile.
# Aptible uses a Procfile to run a docker, the master code base uses Procfile to run Heroku.
# 
# This script pulls down the current master git repo
# It sets up the Procfile to be the Aptible Procfile (via symbolic link)
# Adds and commits the change to git
# pushes the change to the Aptible remote git
# undoes the Procfile change
# undoes the commit
# 
# Assumptions:
#    There is a remote already setup to Aptible github - if not, the commented command can be uncommented
#    The Dockerfile was left in the Heroku link so it is reset to Aptible
# 
# add remote to aptible github - it is assumed to already be set up
#git remote add gitdonaptible http://github.com/donpfisher/DonGitAptible.git
# 
# pull from origin
git pull origin basicdocker

# create link to Procfile for aptible
rm Dockerfile
ln -s Dockerfile_aptible Dockerfile

# add changed Dockerfile to local repo
git add Dockerfile

# commit changes Dockerfile to remo
git commit -m "Dockerfile to aptible"

# push change to aptible github
git push -f gitdonaptible basicprocfile

# undo link
rm Dockerfile
ln -s Dockerfile_heroku Dockerfile

# undo commit
git reset --soft HEAD~

# remove remote to aptible github to leave original remote setup to just origin
#git remote remove gitdonaptible
