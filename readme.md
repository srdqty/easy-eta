# Easy Eta

Docker compose file and scripts I made to experiment with Eta.

## Create New Eta Project

In the root directory of this repo run the following:

```
docker-compose build

mkdir PROJECT_NAME

# Sets the working directory of the docker container to your project directory.
. easy-eta-env.sh PROJECT_NAME

docker-compose run --rm etlas init
```

## Running Eta and Etlas

The following commands assume the root directory of this repo is the current
working directory. Use `-f COMPOSE_FILE` if you want to run the commands from
another directory.

```
docker-compose run --rm eta ETA_ARGUMENTS
docker-compose run --rm etlas ETLAS_ARGUMENTS
```

