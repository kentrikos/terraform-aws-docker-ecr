#!/bin/bash

set -e

if [ $# -lt 2 ]; then echo 'Missing arguments' ; exit 1; fi

clone_url=$1
clone_dir=$2

# check for git binary
which git > /dev/null || { echo 'ERROR: git is not installed' ; exit 1; }

[ -d ${clone_dir} ] || mkdir -p ${clone_dir}

echo "Cloning git from ${clone_url}.."
$(git clone ${clone_url} ${clone_dir}) || { echo 'ERROR: could not clone git' ; exit 1; }
