#!/bin/bash
set -eu

# The address to run enigma node
# The node is running on the host machine be the call to it we expect from the container.
# The hist to make the test pass on mac and linux
ENIGMA_HOST="host.docker.internal"
if ! ping -c 1 $ENIGMA_HOST &> /dev/null
then
  ENIGMA_HOST="0.0.0.0"
fi

# The port of the enigma gRPC
ENIGMA_GRPC_PORT="9090"

# The prefix for cosmos addresses
ENIGMA_ADDRESS_PREFIX="enigma"

# read the mnemonic from param.
ENIGMA_ORCHESTRATOR_MNEMONIC="$1"

# enigma stake denom
STAKE_DENOM=anom

# The URL of the running mock eth node.
ETH_ADDRESS="http://0.0.0.0:8545/"

# The ETH key used for orchestrator signing of the transactions.
ETH_ORCHESTRATOR_PRIVATE_KEY=c40f62e75a11789dbaf6ba82233ce8a52c20efb434281ae6977bb0b3a69bf709

# read already deployed address from the file
GRAVITY_CONTRACT_ADDRESS=$(cat gravity_contract_address)

echo "Starting orchestrator"

gbt --address-prefix="$ENIGMA_ADDRESS_PREFIX" orchestrator \
             --cosmos-phrase="$ENIGMA_ORCHESTRATOR_MNEMONIC" \
             --ethereum-key="$ETH_ORCHESTRATOR_PRIVATE_KEY" \
             --cosmos-grpc="http://$ENIGMA_HOST:$ENIGMA_GRPC_PORT/" \
             --ethereum-rpc="$ETH_ADDRESS" \
             --fees="1$STAKE_DENOM" \
             --gravity-contract-address="$GRAVITY_CONTRACT_ADDRESS"