#!/bin/sh
set -e

#
# a shell script to sync git repos
#

# get current branch
CBRANCH=`git branch | grep -e "^*" | awk '{print $2}'`

# work on 'master' branch
git checkout master

# handle upstream if needed
if [-n `git remote | grep upstream`]; then
    git pull upstream master
    git push
fi

# sync & kill remotes if needed
git fetch -p

# go back to inital branch
git checkout $CBRANCH
