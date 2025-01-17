#!/bin/bash
set -eu

# The address to run enigma node
# The node is running on the host machine be the call to it we expect from the container.
# The hist to make the test pass on mac and linux
ENIGMA_HOST="host.docker.internal"
ORIGINAL_DIR=$PWD
if ! ping -c 1 $ENIGMA_HOST &> /dev/null
then
  ENIGMA_HOST="0.0.0.0"
fi

echo "ENIGMA_HOST: $ENIGMA_HOST"

# The URL of the running mock eth node.
ETH_ADDRESS="http://0.0.0.0:8545/"

# The ETH key used for orchestrator signing of the transactions
ETH_ORCHESTRATOR_PRIVATE_KEY=c40f62e75a11789dbaf6ba82233ce8a52c20efb434281ae6977bb0b3a69bf709

#-------------------- Deploy the contract --------------------

echo "Deploying Gravity contract"
cd /root/home/gravity/solidity
./contract-deployer \
--cosmos-node="http://$ENIGMA_HOST:26657" \
--eth-node="$ETH_ADDRESS" \
--eth-privkey="$ETH_ORCHESTRATOR_PRIVATE_KEY" \
--contract=Gravity.json \
--test-mode=false \
--bnom-address="0x8EFe26D6839108E831D3a37cA503eA4F136A8E73" | grep "Gravity deployed at Address" | grep -Eow '0x[0-9a-fA-F]{40}' > gravity_contract_address

GRAVITY_CONTRACT_ADDRESS=$(cat gravity_contract_address)
cp gravity_contract_address $ORIGINAL_DIR/gravity_contract_address

echo "Contract address: $GRAVITY_CONTRACT_ADDRESS"
