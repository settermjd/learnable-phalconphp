#!/bin/bash

if [ -d cphalcon ]; then
    echo Updating Phalcon Working Copy
    # update the working copy, if it already exists
    cd cphalcon; git pull; cd -;
else
    echo Cloning Phalcon Repository
    git clone --depth=1 git://github.com/phalcon/cphalcon.git
fi;

if [ -d cphalcon ]; then

    # check if Phalcon's already available
    if [ $( php -r 'print_r(extension_loaded("phalcon"));' ) -eq 0 ]; then
        echo Installing Phalcon
        cd cphalcon/build
        sudo ./install
        cd -;

        if [ ! -e /etc/php5/apache2/conf.d/20-phalcon.ini ]; then
            sudo echo extension=phalcon.so > /etc/php5/apache2/conf.d/20-phalcon.ini
        fi;

        if [ ! -e /etc/php5/cli/conf.d/20-phalcon.ini ]; then
            sudo echo extension=phalcon.so > /etc/php5/apache2/conf.d/20-phalcon.ini
     fi;
    fi;
fi;

## Run composer because it has support for the Phalcon devtools
composer install