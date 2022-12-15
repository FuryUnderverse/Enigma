#!/bin/bash
set -eu

echo "Setting snapshot configuration"

# Enigma home dir
ENIGMA_HOME=$HOME/.enigma
# Config directories for enigma node
ENIGMA_HOME_CONFIG="$ENIGMA_HOME/config"
# App config file for enigma node
ENIGMA_APP_CONFIG="$ENIGMA_HOME_CONFIG/app.toml"


# snapshot config
crudini --set $ENIGMA_APP_CONFIG state-sync snapshot-interval 1000
crudini --set $ENIGMA_APP_CONFIG state-sync snapshot-keep-recent 3

echo "The snapshot configuration is updated"