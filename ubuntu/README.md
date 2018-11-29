## Solana Customized LLVM for Ubuntu

This Docker contains LLVM binaries that incorporate customizations and fixes required
by Solana but not yet upstreamed into the LLVM mainline.

https://hub.docker.com/r/solanalabs/llvm/

### Usage:

This Docker is optionally used by the Solana SDK BPF build system.

### Notes:

Attempting to build llvm im travis-ci takes too long and times out, leaving .travis.yml file here for reference and possible future return to using travis-ci.

