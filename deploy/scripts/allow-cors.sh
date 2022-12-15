#!/bin/bash
set -eu

echo "Enabling cors"

# Enigma home dir
ENIGMA_HOME=$HOME/.enigma

# Config directories for enigma node
ENIGMA_HOME_CONFIG="$ENIGMA_HOME/config"
# Config file for enigma node
ENIGMA_NODE_CONFIG="$ENIGMA_HOME_CONFIG/config.toml"
# App config file for enigma node
ENIGMA_APP_CONFIG="$ENIGMA_HOME_CONFIG/app.toml"

crudini --set $ENIGMA_NODE_CONFIG rpc cors_allowed_origins "[\"*\"]"
crudini --set $ENIGMA_APP_CONFIG api enabled-unsafe-cors true