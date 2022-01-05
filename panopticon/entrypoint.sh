#!/bin/bash

echo
echo ls -l /opt/

# set up credentials
if [ ! -e /etc/ospool-creds/idkeys.d ]; then
    echo "Please mount /etc/ospool-creds/idkeys.d/"
    exit 1
fi
if [ ! -e /etc/ospool-creds/idtokens.d ]; then
    echo "Please mount /etc/ospool-creds/idtokens.d/"
    exit 1
fi

echo "Installing HTCondor credentials..."
cd /etc/ospool-creds/idkeys.d
for FILE in *; do
    install -o root -g root -m 0600 $FILE /etc/condor/passwords.d/$FILE
done
cd /etc/ospool-creds/idtokens.d
for FILE in *; do
    install -o condor -g condor -m 0600 $FILE /etc/condor/tokens.d/$FILE
done

# now start fifemon
if [ "X$DEPLOYMENT_ENV" = "Xproduction" ]; then
    fifemon /etc/fifemon.cfg-production
else
    fifemon /etc/fifemon.cfg-development
fi

