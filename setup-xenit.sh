#!/bin/bash -ex

# This script is used to manage a folder strucutre to make it easier to not overwrite kubeconfig while switching between customers.

DIR=$HOME
BASE_FOLDER=projects/xenit

# Add direnv config for each folder
for folder in $(ls -1 ~/$BASE_FOLDER); do
    if [ -f ~/$BASE_FOLDER/${folder}/.envrc ]; then
        mkdir -p ~/$BASE_FOLDER/${folder}/.envrc_backups
        cp ~/$BASE_FOLDER/${folder}/.envrc ~/$BASE_FOLDER/${folder}/.envrc_backups/envrc_bak_${DATE}
    fi
    cp ${DIR}/direnv/.envrc ~/$BASE_FOLDER/${folder}/.envrc
    direnv allow ~/$BASE_FOLDER/${folder}/
done

# Add direnv to use with create-workspace function
cp ${DIR}/direnv/.envrc ~/.create_workspace_envrc
