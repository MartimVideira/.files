#!/bin/bash
git clone --bare https://github.com/MartimVideira/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# Function that move file to target destination, if folders in path do not exist
# it creates them
function mvp {
    local source=$1
    local destination=$2
    #echo "Moving" $1 " to " $2
    mv $source $destination > /dev/null 2>$1
    if [ $? = 1 ]; then
        dirname $destination | xargs -I{} mkdir -p {}; mv -v $source $destination
    fi;
}
export -f mvp
mkdir -p .config-backup

# Actually Loads workspace -> we were on a barerepository
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files."
    config checkout  2>&1 | egrep "^\s\S+$" | awk {'print $1'} |  xargs -I {} bash -c 'mvp "$@" .config-backup/"$@"' {} {}
fi;
config checkout
config config status.showUntrackedFiles no
