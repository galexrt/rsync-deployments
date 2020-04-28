#!/bin/sh

set -eu

SSH_PORT="${SSH_PORT:-22}"

# Set deploy key
SSH_PATH="$HOME/.ssh"
mkdir -p "$SSH_PATH"
echo "$DEPLOY_KEY" > "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key"

# Do deployment
rsync -e "ssh -p $SSH_PORT -i $SSH_PATH/deploy_key -o StrictHostKeyChecking=no" $RSYNC_ARGS
