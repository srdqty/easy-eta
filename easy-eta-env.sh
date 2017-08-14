#!/usr/bin/env bash

# Grab the user id and group id of the current user.
# We will add a user with these ids in the docker image and run the container as
# that user so that generated files have the correct permissions.
export ETA_UID=`id -u`
export ETA_GID=`id -g`

# The working directory of the docker container will be set based on this
# environment variable.
export ETA_PROJECT_ROOT="`pwd`/$1"
