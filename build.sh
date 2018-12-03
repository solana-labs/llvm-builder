#!/usr/bin/env bash
set -ex

rm -rf deploy
mkdir -p deploy

(cd linux && ./build.sh )
cp linux/out/solana-llvm-linux.tar.bz2 deploy

if [ "$(uname)" == "Darwin" ]; then
  (cd osx && ./build.sh )
  cp osx/out/solana-llvm-osx.tar.bz2 deploy
else
  echo Warning: Local machine not a Mac, cannot build osx variant, skipping
fi


