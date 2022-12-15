#!/bin/bash
set -eu

echo "Enable the node's monitoring"

# Enigma home dir
ENIGMA_HOME=$HOME/.enigma
# Config directories for enigma node
ENIGMA_HOME_CONFIG="$ENIGMA_HOME/config"
# Config file for enigma node
ENIGMA_NODE_CONFIG="$ENIGMA_HOME_CONFIG/config.toml"

crudini --set $ENIGMA_NODE_CONFIG instrumentation prometheus true

echo "The prometheus is enabled"