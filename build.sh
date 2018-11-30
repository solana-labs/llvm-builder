#!/usr/bin/env bash
set -ex

rm -rf deploy
mkdir -p deploy

(cd linux && ./build.sh )
cp linux/out/solana-llvm-linux.tar.bz2 deploy

if [ "$(uname)" == "Darwin" ]; then
  (cd macos && ./build.sh )
  cp macos/out/solana-llvm-macos.tar.bz2 deploy
else
  echo Warning: Local machine not a Mac, cannot build macos variant, skipping
fi


