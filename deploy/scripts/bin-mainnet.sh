#Setting up constants
ENIGMA_HOME=$HOME/.enigma

ENIGMA_VERSION="v1.0.0"
COSMOVISOR_VERSION="cosmovisor-v1.0.1"

mkdir -p $ENIGMA_HOME
mkdir -p $ENIGMA_HOME/bin
mkdir -p $ENIGMA_HOME/contracts
mkdir -p $ENIGMA_HOME/logs
mkdir -p $ENIGMA_HOME/cosmovisor/genesis/bin
mkdir -p $ENIGMA_HOME/cosmovisor/upgrades/bin

echo "-----------installing dependencies---------------"
sudo dnf -y update
sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf -y install subscription-manager
sudo subscription-manager config --rhsm.manage_repos=1
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
sudo dnf makecache --refresh
sudo dnf -y --skip-broken install curl nano ca-certificates tar git jq moreutils wget hostname procps-ng pass libsecret pinentry crudini

set -eu

echo "----------------------installing enigma---------------"
curl -LO https://github.com/furyunderverse/enigma/releases/download/$ENIGMA_VERSION/enigmad
mv enigmad $ENIGMA_HOME/cosmovisor/genesis/bin/enigmad

echo "----------------------installing cosmovisor---------------"
curl -LO https://github.com/furyunderverse/enigma-sdk/releases/download/$COSMOVISOR_VERSION/cosmovisor
mv cosmovisor $ENIGMA_HOME/bin/cosmovisor

echo "-------------------adding binaries to path-----------------------"
chmod +x $ENIGMA_HOME/bin/*
export PATH=$PATH:$ENIGMA_HOME/bin
chmod +x $ENIGMA_HOME/cosmovisor/genesis/bin/*
export PATH=$PATH:$ENIGMA_HOME/cosmovisor/genesis/bin

echo "export PATH=$PATH" >> ~/.bashrc

# set the cosmovisor environments
echo "export DAEMON_HOME=$ENIGMA_HOME/" >> ~/.bashrc
echo "export DAEMON_NAME=enigmad" >> ~/.bashrc
echo "export DAEMON_RESTART_AFTER_UPGRADE=true" >> ~/.bashrc

echo "Enigma binaries are installed successfully."
