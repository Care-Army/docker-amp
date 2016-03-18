#!/bin/bash

# Get number of instances
INSTANCES="$(./ampinstmgr -l | grep "Instance ID" | wc -l)"

if [ "$INSTANCES" -gt "0" ]
then
  echo "Starting instance..."
  cd .ampdata/instances/Default
  ./AMP_Linux_x86_64
else
  echo "Creating instance..."
  ./ampinstmgr -c $AMP_MODULE Default 0.0.0.0 $AMP_PORT $AMP_LICENSE $AMP_PASSWORD $AMP_FLAGS
  cd .ampdata/instances/Default
  ./AMP_Linux_x86_64

  # Example command
  # ./ampinstmgr -c Rust MyRustServer 0.0.0.0 8080 [YOURKEYGOESHERE] Password123 +RustModule.Rust.MaxPlayers 10 +RustModule.Rust.TickRate 60
fi
