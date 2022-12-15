#!/bin/bash
# the script run inside the container for all-up-test.sh
NODES=$1
TEST_TYPE=$2
ALCHEMY_ID=$3
set -eux

bash /enigma/tests/gravity/container-scripts/setup-validators.sh $NODES
bash /enigma/tests/gravity/container-scripts/run-testnet.sh $NODES $TEST_TYPE $ALCHEMY_ID &

# deploy the ethereum contracts
DEPLOY_CONTRACTS=1 RUST_BACKTRACE=full CHAIN_BINARY=enigmad ADDRESS_PREFIX=enigma RUST_LOG=INFO test-runner
bash /enigma/tests/gravity/container-scripts/integration-tests.sh $NODES $TEST_TYPE