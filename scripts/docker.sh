#!/bin/bash

set -e

if [ $# -lt 4 ]; then echo 'Missing arguments' ; exit 1; fi

working_dir=$1
ecr_url=$2
region=$3
build_tag=$4

# check for git binary
which aws > /dev/null || { echo 'ERROR: aws-cli is not installed' ; exit 1; }

# check that docker is installed and running
which docker > /dev/null && docker ps > /dev/null || { echo 'ERROR: docker is not running' ; exit 1; }

# login to ecr
echo "Logging into ECR.."
$(aws ecr get-login --no-include-email --region $region) || { echo 'ERROR: aws ecr login failed' ; exit 1; }

echo "Building docker image.."
docker build -t $ecr_url:$build_tag $working_dir

echo "Pushing docker image to $ecr_url"
docker push $ecr_url