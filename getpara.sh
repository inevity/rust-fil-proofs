#!/bin/bash

set -e

# This is the default parameter location.
#OUTPUT_DIR="/var/tmp/filecoin-proof-parameters"
OUTPUT_DIR="/mnt/ipfs/filecoin-proof-parameters"

# A list of 2KiB parameter files required for tests.
PARAMETER_FILES="v28-proof-of-spacetime-fallback-merkletree-poseidon_hasher-8-0-0-0170db1f394b35d995252228ee359194b13199d259380541dc529fb0099096b0.params v28-proof-of-spacetime-fallback-merkletree-poseidon_hasher-8-0-0-0170db1f394b35d995252228ee359194b13199d259380541dc529fb0099096b0.vk v28-proof-of-spacetime-fallback-merkletree-poseidon_hasher-8-0-0-3ea05428c9d11689f23529cde32fd30aabd50f7d2c93657c1d3650bca3e8ea9e.params v28-proof-of-spacetime-fallback-merkletree-poseidon_hasher-8-0-0-3ea05428c9d11689f23529cde32fd30aabd50f7d2c93657c1d3650bca3e8ea9e.vk v28-stacked-proof-of-replication-merkletree-poseidon_hasher-8-0-0-sha256_hasher-032d3138d22506ec0082ed72b2dcba18df18477904e35bafee82b3793b06832f.params v28-stacked-proof-of-replication-merkletree-poseidon_hasher-8-0-0-sha256_hasher-032d3138d22506ec0082ed72b2dcba18df18477904e35bafee82b3793b06832f.vk"  

# Make sure output location exists.
if [ ! -d ${OUTPUT_DIR} ]; then
    mkdir -p ${OUTPUT_DIR}
fi

export https_proxy=http://192.168.1.185:8080
# Download parameter files.
for f in ${PARAMETER_FILES}; do
    echo "Checking for ${OUTPUT_DIR}/$f"
    if [ ! -f ${OUTPUT_DIR}/$f ]; then
        echo "Downloading $f"
        wget  https://proofs.filecoin.io/$f -O ${OUTPUT_DIR}/$f
    else
        echo "${OUTPUT_DIR}/$f already exists!"
    fi
done


