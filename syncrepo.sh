#!/bin/sh
set -e

#
# a shell script to sync git repos
#

# get current branch
CBRANCH=`git branch | grep -e "^*" | awk '{print $2}'`

# work on 'master' branch (if needed)
if [ "master" != "$CBRANCH" ]; then
    git checkout master
fi

# handle upstream if needed
HASUPSTREAM=`git remote | grep upstream`
if [ -n "$HASUPSTREAM" ]; then
    git pull
    git pull upstream master
    git push
fi

# sync & kill remotes if needed
git fetch -p

# go back to inital branch (if needed)
if [ "master" != "$CBRANCH" ]; then
    git checkout $CBRANCH
fi
