# Name of the enigma artifact
ENIGMA=enigmad
# The name of the enigma node
ENIGMA_NODE_NAME="enigma"
# The address to run enigma node
ENIGMA_HOST="0.0.0.0"
# The port of the enigma gRPC
ENIGMA_GRPC_PORT="9090"

echo "Running enigma..."
$ENIGMA start --pruning=nothing &

echo "Waiting $ENIGMA_NODE_NAME to launch gRPC $ENIGMA_GRPC_PORT..."

while ! timeout 1 bash -c "</dev/tcp/$ENIGMA_HOST/$ENIGMA_GRPC_PORT"; do
  sleep 1
done

echo "$ENIGMA_NODE_NAME launched"