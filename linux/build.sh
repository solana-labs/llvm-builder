#!/usr/bin/env bash
set -ex

cd "$(dirname "$0")"

docker build -t solanalabs/llvm .
# docker push solanalabs/llvm

rm -rf out
mkdir -p out
cd out

# Copy out and bundle release products
mkdir -p deploy
id=$(docker create solanalabs/llvm)
docker cp "$id":/usr/local/version.md deploy
docker cp "$id":/usr/local/bin deploy
docker cp "$id":/usr/local/lib deploy
docker rm -v "$id"
tar -C deploy -zcf solana-llvm-linux.tgz .

