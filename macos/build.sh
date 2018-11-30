#!/usr/bin/env bash
set -ex

cd "$(dirname "$0")"

rm -rf out
mkdir -p out
cd out

git clone https://github.com/solana-labs/llvm.git
echo "$( cd llvm && git rev-parse HEAD )  https://github.com/solana-labs/llvm.git" >> version.md
git clone https://github.com/solana-labs/clang.git llvm/tools/clang
echo "$( cd llvm/tools/clang && git rev-parse HEAD )  https://github.com/solana-labs/clang.git" >> version.md
git clone https://github.com/solana-labs/clang-tools-extra.git llvm/tools/clang/tools/extra
echo "$( cd llvm/tools/clang/tools/extra && git rev-parse HEAD )  https://github.com/solana-labs/clang-tools-extra.git" >> version.md
git clone https://github.com/solana-labs/compiler-rt.git llvm/projects/compiler-rt
echo "$( cd llvm/projects/compiler-rt && git rev-parse HEAD )  https://github.com/solana-labs/compiler-rt.git" >> version.md
git clone https://github.com/solana-labs/lld.git llvm/tools/lld
echo "$( cd llvm/tools/lld && git rev-parse HEAD )  https://github.com/solana-labs/lld.git" >> version.md

mkdir -p llvm/build
pushd llvm/build
cmake -DCMAKE_BUILD_TYPE="MinSizeRel" \
      -DLLVM_TARGETS_TO_BUILD=BPF \
      -DLLVM_BUILD_LLVM_DYLIB=ON \
      -DLLVM_ENABLE_LIBCXX=ON \
      -DLLVM_BUILD_TOOLS=OFF \
      -DLLVM_INCLUDE_EXAMPLES=OFF \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_INCLUDE_BENCHMARKS=OFF \
      -DLLVM_ENABLE_LIBPFM=OFF \
      -DLLVM_ENABLE_ZLIB=OFF \
      -DLLVM_ENABLE_DIA_SDK=OFF \
      -G "Ninja" ..
ninja -j6 llvm-objdump
ninja -j6 lld
ninja -j6 llc
ninja -j6 clang
popd

rm -rf deploy
mkdir -p deploy/lib
cp version.md deploy
cp -rf llvm/build/bin deploy
cp -rf llvm/build/lib/clang deploy/lib
tar -C deploy -zcf solana-llvm-macos.tgz .
