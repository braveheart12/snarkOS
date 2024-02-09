#!/bin/bash

# USAGE examples: 
  # CLI :  ./run-client.sh

COMMAND='cargo run --release -- start --nodisplay --client'

for word in $*;
do
  COMMAND="${COMMAND} ${word}"
done

function exit_node()
{
    echo "Exiting..."
    kill $!
    exit
}

trap exit_node SIGINT

echo "Running an Aleo client node..."
$COMMAND &

