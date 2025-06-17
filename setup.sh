if [[ -z "$GIT_TOKEN" ]]; then
  echo "Provide git access token as 'GIT_TOKEN' environment variable."
  exit 1
fi
cd "$HOME"
git_token_file="$HOME/git_access_token.txt"
echo "$GIT_TOKEN" > $git_token_file
echo "cloning repository 'lassmanjm/bash_profile'"
git clone --recurse-submodules https://lassmanjm:$GIT_TOKEN@github.com/lassmanjm/bash_profile || exit $?
$HOME/bash_profile/setup.sh
source $HOME/.zshrc
