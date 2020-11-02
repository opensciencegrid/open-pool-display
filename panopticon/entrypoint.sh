#!/bin/bash

echo
echo ls -l /opt/

# set up credentials
if [ ! -e /opt/open-pool-credentials/open-pool-credentials-targz ]; then
    echo "Please mount /opt/open-pool-credentials/"
    #exit 1
fi

cd /etc/condor
ls -l /opt/open-pool-credentials/open-pool-credentials-targz
tar xzf /opt/open-pool-credentials/open-pool-credentials-targz
# permissions should be correct here, but what about ownership?

# now start fifemon
if [ "X$DEPLOYMENT_ENV" = "Xproduction" ]; then
    fifemon /etc/fifemon.cfg-production
else
    fifemon /etc/fifemon.cfg-development
fi

