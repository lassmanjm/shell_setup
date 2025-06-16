#!/bin/bash

if [[ $# -lt 1 ]]; then
  echo "Provide git access token"
  exit 1
fi
cd "$HOME"
git_key="$1"
git_token_file="$HOME/git_access_token.txt"
echo "$git_key" > $git_token_file
echo "cloning repository 'lassmanjm/bash_profile'"
git clone --recurse-submodules https://lassmanjm:$git_key@github.com/lassmanjm/bash_profile || exit $?
$HOME/bash_profile/setup.sh
source $HOME/.bashrc
