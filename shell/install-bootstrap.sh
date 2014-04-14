#!/bin/bash


if [ -d bootstrap ]; then
    echo Updating Twitter Bootstrap working copy
    # update the working copy, if it already exists
    cd bootstrap; git pull; cd -;
else
    echo Cloning Twitter Bootstrap
    git clone https://github.com/twbs/bootstrap.git
fi;

if [ -d bootstrap ]; then
    echo Installing Twitter Bootstrap from GitHub
    echo Copying Bootstrap Files to Public Directory
    cp -rvf bootstrap/dist/{css,fonts,js} talk/public/
fi;