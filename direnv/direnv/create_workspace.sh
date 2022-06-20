#
# This file is created using the command XYZ
# Don't modify anything in here since it will be created / synchronized using the above command
# Store everything specific in the file .envrc_<folder name> which won't be touched during synchronization
#

# Directory specific configuration
[ -f $(pwd)/.envrc_$(basename $(pwd)) ] || touch $(pwd)/.envrc_$(basename $(pwd)) # Create folder specific envrc if it doesn't exists
source_env $(pwd)/.envrc_$(basename $(pwd)) # Load the folder specific envrc

if [[ -z "${AZURE_TENANT_ID}" ]]; then
    echo "NOTE: You should define AZURE_TENANT_ID in the .envrc_$(basename $(pwd)) file!"
fi

# Environment variables
export KUBECONFIG=$(pwd)/.kube/config
export GIT_SSH_COMMAND="ssh -i $(pwd)/.ssh/id_rsa -o 'HostkeyAlgorithms=+ssh-rsa' -o 'PubkeyAcceptedKeyTypes=+ssh-rsa'"
export AZURE_CONFIG_DIR=$(pwd)/.azure

ssh-add -q -K $(pwd)/.ssh/id_rsa

# Configuration folders
[ -d $(pwd)/.envrc_backups ] || mkdir $(pwd)/.envrc_backups # Store .envrc backups here
[ -d $(pwd)/.kube ] || mkdir $(pwd)/.kube # Store Kubernetes (kubectl) configuration here
[ -d $(pwd)/.azure ] || mkdir $(pwd)/.azure # Store Azure CLI configuration here

# use keychain
eval $(keychain --eval $(pwd)/.ssh/id_rsa)
