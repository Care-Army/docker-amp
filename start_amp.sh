#!/bin/bash

# Get number of instances
INSTANCES="$(./ampinstmgr -l | grep "Instance ID" | wc -l)"

if [ "$INSTANCES" -gt "0" ]
then
  echo "Starting instances..."
  ./ampinstmgr -a
else
  echo "Creating instance..."
  ./ampinstmgr -c $AMP_MODULE $AMP_INSTANCE_NAME $AMP_IP $AMP_PORT $AMP_LICENSE $AMP_PASSWORD $AMP_FLAGS
  # Example command
  # ./ampinstmgr -c Rust MyRustServer 0.0.0.0 8080 [YOURKEYGOESHERE] Password123 +RustModule.Rust.MaxPlayers 10 +RustModule.Rust.TickRate 60
fi
