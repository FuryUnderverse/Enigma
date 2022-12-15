#!/bin/bash
set -eu

echo "Stopping enigma node"

pkill enigmad && echo "enigmad is stopped"
