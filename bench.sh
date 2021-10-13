#!/bin/bash

# for 128GB meory node
#sudo fallocate -l 256G /swapfile
#sudo chmod 600 /swapfile
#sudo mkswap /swapfile
#sudo swapon /swapfile
## show current swap spaces and take note of the current highest priority
#swapon --show
## append the following line to /etc/fstab (ensure highest priority) and then reboot
## /swapfile swap swap pri=50 0 0
#sudo reboot
## check a 256GB swap file is automatically mounted and has the highest priority
#swapon --show
#

#
## for 128GB meory node
#fallocate -l 256G /mnt/ipfs/swapfile
#chmod 600 /mnt/ipfs/swapfile
#mkswap /mnt/ipfs/swapfile
swapoff -a 
swapon /mnt/ipfs/swapfile
# show current swap spaces and take note of the current highest priority
swapon --show
# append the following line to /etc/fstab (ensure highest priority) and then reboot
# /swapfile swap swap pri=50 0 0
#sudo reboot
# check a 256GB swap file is automatically mounted and has the highest priority
#swapon --show

#cargo build --release --workspace
cp target/release/paramcache /root
#/root/paramcache --sector-sizes='2048,4096,16384,32768,536870912'
#/root/paramcache --sector-sizes='2048,536870912,34359738368'
#/root/paramcache --sector-sizes='2048,536870912,1073741824,2147483648'
/root/paramcache --sector-sizes='2048,536870912,1073741824'
#/root/paramcache --sector-sizes='2048,536870912,1073741824,4294967296'
https_proxy=http://192.168.1.185:8080 cargo run --release --bin paramfetch -- -a -j srs-inner-product.json
#RUST_BACKTRACE=1 cargo run --release --bin benchy -- window-post --size 2kiB
export BELLMAN_NO_GPU=1
export FIL_PROOFS_USE_MULTICORE_SDR=true
export FIL_PROOFS_PARAMETER_CACHE=/mnt/ipfs/filecoin-proof-parameters
export RUST_LOG=info
export FIL_PROOFS_PARENT_CACHE=/mnt/ipfs/filecoin-proof-parametersparecache
export TMPDIR=/mnt/ipfs/filecoin-proof-parameterstmpdirforseal
export FIL_PROOFS_VERIFY_CACHE=1

#FIL_PROOFS_USE_GPU_COLUMN_BUILDER=1
#Similarly, the 'tree_r_last' tree can also be built using the GPU, which provides at least a 2x speed-up over the CPU. To activate the GPU for this, use the environment variable

#FIL_PROOFS_USE_GPU_TREE_BUILDER=1
#[Advanced Storage Tuning](https://github.com/filecoin-project/rust-fil-proofs/blob/master/README.md)
#RUST_BACKTRACE=1 cargo run --release --bin benchy -- help
#RUST_BACKTRACE=1 cargo run --release --bin benchy -- windows-post --help
#RUST_BACKTRACE=1 cargo run --release --bin benchy -- window-post --help
#grep -nri BELLMAN_NO_GPU .
#history
#1RUST_BACKTRACE=1 cargo run --release --bin benchy -- window-post --size 2kiB
#grep -nr FFI_BUILD_FROM_SOURCE .

swapoff -a 
#RUSTFLAGS="-C target-cpu=native -g" FFI_BUILD_FROM_SOURCE=1 RUST_BACKTRACE=1 cargo run --release --no-default-features --features pairing --bin benchy -- window-post --size 32GiB
RUSTFLAGS="-C target-cpu=native -g" FFI_BUILD_FROM_SOURCE=1 RUST_BACKTRACE=1 cargo run --release --no-default-features --features pairing --bin benchy -- window-post --size 1GiB
swapoff -a 
#RUSTFLAGS="-C target-cpu=native -g" FFI_BUILD_FROM_SOURCE=1 RUST_BACKTRACE=1 cargo run --release --no-default-features --features pairing --bin benchy -- window-post --size 2GiB
#swapoff -a 
RUSTFLAGS="-C target-cpu=native -g" FFI_BUILD_FROM_SOURCE=1 RUST_BACKTRACE=1 cargo run --release --no-default-features --features pairing --bin benchy -- window-post --size 2kiB
swapoff -a 
RUSTFLAGS="-C target-cpu=native -g" FFI_BUILD_FROM_SOURCE=1 RUST_BACKTRACE=1 cargo run --release --no-default-features --features pairing --bin benchy -- window-post --size 512MiB
swapoff -a 
# or use this cat rust-fil-proofs.config.toml.sample 
# but if bashrc have set, will conflict??
