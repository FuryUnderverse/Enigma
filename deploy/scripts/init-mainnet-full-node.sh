#!/bin/bash
set -eu

echo "Initializing full node"

# Enigma home dir
ENIGMA_HOME=$HOME/.enigma

# Name of the network to bootstrap
CHAINID="enigma-mainnet-1"
# The address to run enigma node
ENIGMA_HOST="0.0.0.0"
# The port of the enigma gRPC
ENIGMA_GRPC_PORT="9191"
# Config directories for enigma node
ENIGMA_HOME_CONFIG="$ENIGMA_HOME/config"
# Config file for enigma node
ENIGMA_NODE_CONFIG="$ENIGMA_HOME_CONFIG/config.toml"
# App config file for enigma node
ENIGMA_APP_CONFIG="$ENIGMA_HOME_CONFIG/app.toml"
# Chain ID flag
ENIGMA_CHAINID_FLAG="--chain-id $CHAINID"
# Seeds IPs
ENIGMA_SEEDS_DEFAULT_IPS="44.213.44.5,3.210.0.126"
# Statysync servers default IPs
ENIGMA_STATESYNC_SERVERS_DEFAULT_IPS="52.70.182.125,44.195.221.88"

read -r -p "Enter a name for your node [enigma]:" ENIGMA_NODE_NAME
ENIGMA_NODE_NAME=${ENIGMA_NODE_NAME:-enigma}

read -r -p "Enter seeds ips [$ENIGMA_SEEDS_DEFAULT_IPS]:" ENIGMA_SEEDS_IPS
ENIGMA_SEEDS_IPS=${ENIGMA_SEEDS_IPS:-$ENIGMA_SEEDS_DEFAULT_IPS}

default_ip=$(hostname -I | awk '{print $1}')
read -r -p "Enter your ip address [$default_ip]:" ip
ip=${ip:-$default_ip}

ENIGMA_SEEDS=
for seedIP in ${ENIGMA_SEEDS_IPS//,/ } ; do
  wget $seedIP:26657/status? -O $ENIGMA_HOME/seed_status.json
  seedID=$(jq -r .result.node_info.id $ENIGMA_HOME/seed_status.json)

  if [[ -z "${seedID}" ]]; then
    echo "Something went wrong, can't fetch $seedIP info: "
    cat $ENIGMA_HOME/seed_status.json
    exit 1
  fi

  rm $ENIGMA_HOME/seed_status.json

  ENIGMA_SEEDS="$ENIGMA_SEEDS$seedID@$seedIP:26656,"
done

# create home directory
mkdir -p $ENIGMA_HOME

# ------------------ Init enigma ------------------
echo "Creating $ENIGMA_NODE_NAME node with chain-id=$CHAINID..."

# Initialize the home directory and add some keys
echo "Initializing chain"
enigmad $ENIGMA_CHAINID_FLAG init $ENIGMA_NODE_NAME

#copy genesis file
cp -r ../genesis/genesis-mainnet-1.json $ENIGMA_HOME_CONFIG/genesis.json

echo "Updating node config"

read -r -p "Do you want to setup state-sync?(y/n)[N]: " statesync
statesync=${statesync:-n}

statesync_nodes=
blk_height=
blk_hash=
if [[ $statesync = 'y' ]] || [[ $statesync = 'Y' ]]; then
    read -r -p "Enter IPs of statesync nodes (at least 2) [$ENIGMA_STATESYNC_SERVERS_DEFAULT_IPS]:" statesync_ips
    statesync_ips=${statesync_ips:-$ENIGMA_STATESYNC_SERVERS_DEFAULT_IPS}
    for statesync_ip in ${statesync_ips//,/ } ; do
      blk_details=$(curl -s http://$statesync_ip:26657/block | jq -r '.result.block.header.height + "\n" + .result.block_id.hash')
      blk_height=$(echo $blk_details | cut -d$' ' -f1)
      blk_hash=$(echo $blk_details | cut -d$' ' -f2)
      statesync_nodes="$statesync_nodes$statesync_ip:26657,"
    done

    # Change statesync settings
    crudini --set $ENIGMA_NODE_CONFIG statesync enable true
    crudini --set $ENIGMA_NODE_CONFIG statesync rpc_servers "\"$statesync_nodes\""
    crudini --set $ENIGMA_NODE_CONFIG statesync trust_height $blk_height
    crudini --set $ENIGMA_NODE_CONFIG statesync trust_hash "\"$blk_hash\""
    echo "Setup for statesync is complete"
fi

# change config
crudini --set $ENIGMA_NODE_CONFIG p2p addr_book_strict false
crudini --set $ENIGMA_NODE_CONFIG p2p external_address "\"tcp://$ip:26656\""
crudini --set $ENIGMA_NODE_CONFIG p2p seeds "\"$ENIGMA_SEEDS\""
crudini --set $ENIGMA_NODE_CONFIG rpc laddr "\"tcp://$ENIGMA_HOST:26657\""

crudini --set $ENIGMA_APP_CONFIG grpc enable true
crudini --set $ENIGMA_APP_CONFIG grpc address "\"$ENIGMA_HOST:$ENIGMA_GRPC_PORT\""
crudini --set $ENIGMA_APP_CONFIG api enable true
crudini --set $ENIGMA_APP_CONFIG api swagger true

echo "The initialisation of $ENIGMA_NODE_NAME is done"