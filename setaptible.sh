#!/bin/bash
#Test: setup to configure HealthPals-api to run in Aptible docker
#
#
# 
# add remote to aptible github
git remote add gitdonaptible http://github.com/donpfisher/DonGitAptible.git
# 
# pull from origin
git pull origin basicdocker

# add changed Dockerfile to local repo
git add Dockerfile

# commit changes Dockerfile to remo
git commit -m "Dockerfile to aptible"

# push change to aptible github
git push -f gitdonaptible basicdocker

# undo commit
git reset --soft HEAD~

# remove remote to aptible github to leave original remote setup to just origin
git remote remove gitdonaptible
