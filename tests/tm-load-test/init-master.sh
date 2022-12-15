#!/bin/bash
set -eu

echo "Initializing master node"
# Initial dir
ENIGMA_HOME=$HOME/.enigma
# Name of the network to bootstrap
CHAINID="enigma-tm-load-test-chain"
# Name of the enigma artifact
ENIGMA=enigmad
# The name of the enigma node
ENIGMA_NODE_NAME="enigma"
# The address to run enigma node
ENIGMA_HOST="0.0.0.0"
# Config directories for enigma node
ENIGMA_HOME_CONFIG="$ENIGMA_HOME/config"
# Config file for enigma node
ENIGMA_NODE_CONFIG="$ENIGMA_HOME_CONFIG/config.toml"
# App config file for enigma node
ENIGMA_APP_CONFIG="$ENIGMA_HOME_CONFIG/app.toml"
# Keyring flag
ENIGMA_KEYRING_FLAG="--keyring-backend test"
# Chain ID flag
ENIGMA_CHAINID_FLAG="--chain-id $CHAINID"
# The name of the enigma validator
ENIGMA_VALIDATOR_NAME=validator1
# Enigma chain demons
STAKE_DENOM="anom"
#NORMAL_DENOM="samoleans"
NORMAL_DENOM="footoken"

mkdir -p $ENIGMA_HOME

# Switch sed command in the case of linux
fsed() {
  if [ `uname` = 'Linux' ]; then
    sed -i "$@"
  else
    sed -i '' "$@"
  fi
}
# ------------------ Init enigma ------------------

echo "Creating $ENIGMA_NODE_NAME validator with chain-id=$CHAINID..."
echo "Initializing genesis files"
# Build genesis file incl account for passed address
ENIGMA_GENESIS_COINS="1000000000000000000000000$STAKE_DENOM,1000000000000000000000000$NORMAL_DENOM"

# Initialize the home directory and add some keys
echo "Init test chain"
$ENIGMA $ENIGMA_CHAINID_FLAG init $ENIGMA_NODE_NAME

echo "Set stake/mint demon to $STAKE_DENOM"
fsed "s#\"stake\"#\"$STAKE_DENOM\"#g" $ENIGMA_HOME_CONFIG/genesis.json

echo "Add validator key"
$ENIGMA keys add $ENIGMA_VALIDATOR_NAME $ENIGMA_KEYRING_FLAG --output json | jq . >> $ENIGMA_HOME/validator_key.json
jq -r .mnemonic $ENIGMA_HOME/validator_key.json > $ENIGMA_HOME/validator-phrases

echo "Adding validator addresses to genesis files"
$ENIGMA add-genesis-account "$($ENIGMA keys show $ENIGMA_VALIDATOR_NAME -a $ENIGMA_KEYRING_FLAG)" $ENIGMA_GENESIS_COINS

echo "Generating ethereum keys"
$ENIGMA eth_keys add --output=json | jq . >> $ENIGMA_HOME/eth_key.json

echo "Creating gentxs"
$ENIGMA gravity gentx $ENIGMA_VALIDATOR_NAME 1000000000000000000000000$STAKE_DENOM "$(jq -r .address $ENIGMA_HOME/eth_key.json)" "$(jq -r .address $ENIGMA_HOME/validator_key.json)" --moniker validator --ip $ENIGMA_HOST $ENIGMA_KEYRING_FLAG $ENIGMA_CHAINID_FLAG

echo "Collecting gentxs in $ENIGMA_NODE_NAME"
$ENIGMA gravity collect-gentxs

echo "Exposing ports and APIs of the $ENIGMA_NODE_NAME"

# Change ports
fsed "s#\"tcp://127.0.0.1:26656\"#\"tcp://$ENIGMA_HOST:26656\"#g" $ENIGMA_NODE_CONFIG
fsed "s#\"tcp://127.0.0.1:26657\"#\"tcp://$ENIGMA_HOST:26657\"#g" $ENIGMA_NODE_CONFIG
fsed 's#addr_book_strict = true#addr_book_strict = false#g' $ENIGMA_NODE_CONFIG
fsed 's#external_address = ""#external_address = "tcp://'$ENIGMA_HOST:26656'"#g' $ENIGMA_NODE_CONFIG
fsed 's#log_level = \"info\"#log_level = \"error\"#g' $ENIGMA_NODE_CONFIG
fsed 's#enable = false#enable = true#g' $ENIGMA_APP_CONFIG
fsed 's#swagger = false#swagger = true#g' $ENIGMA_APP_CONFIG