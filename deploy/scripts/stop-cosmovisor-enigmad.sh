#!/bin/bash
set -eu

echo "Stopping enigma node"

pkill cosmovisor && echo "cosmovisor-enigmad is stopped"
