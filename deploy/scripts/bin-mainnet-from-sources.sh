#Setting up constants
ENIGMA_HOME=$HOME/.enigma
ENIGMA_SRC=$ENIGMA_HOME/src/enigma
COSMOVISOR_SRC=$ENIGMA_HOME/src/cosmovisor

ENIGMA_VERSION="v1.0.0"
COSMOVISOR_VERSION="cosmovisor-v1.0.1"

mkdir -p $ENIGMA_HOME
mkdir -p $ENIGMA_HOME/src
mkdir -p $ENIGMA_HOME/bin
mkdir -p $ENIGMA_HOME/logs
mkdir -p $ENIGMA_HOME/cosmovisor/genesis/bin
mkdir -p $ENIGMA_HOME/cosmovisor/upgrades/bin

echo "-----------installing dependencies---------------"
sudo dnf -y update
sudo dnf -y copr enable ngompa/musl-libc
sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf -y install subscription-manager
sudo subscription-manager config --rhsm.manage_repos=1
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
sudo dnf makecache --refresh
sudo dnf -y --skip-broken install curl nano ca-certificates tar git jq gcc-c++ gcc-toolset-9 openssl-devel musl-devel musl-gcc gmp-devel perl python3 moreutils wget nodejs make hostname procps-ng pass libsecret pinentry crudini cmake

gcc_source="/opt/rh/gcc-toolset-9/enable"
if test -f $gcc_source; then
   source gcc_source
fi

set -eu

echo "--------------installing golang---------------------------"
curl https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz --output $HOME/go.tar.gz
tar -C $HOME -xzf $HOME/go.tar.gz
rm $HOME/go.tar.gz
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/go
echo "export GOPATH=$HOME/go" >> ~/.bashrc
go version

echo "----------------------installing enigma---------------"
git clone -b $ENIGMA_VERSION https://github.com/furyunderverse/enigma.git $ENIGMA_SRC
cd $ENIGMA_SRC
make build
mv enigmad $ENIGMA_HOME/cosmovisor/genesis/bin/enigmad

echo "-------------------installing cosmovisor-----------------------"
git clone -b $COSMOVISOR_VERSION https://github.com/onomyprotocol/onomy-sdk $COSMOVISOR_SRC
cd $COSMOVISOR_SRC
make cosmovisor
cp cosmovisor/cosmovisor $ENIGMA_HOME/bin/cosmovisor

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
