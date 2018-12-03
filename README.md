# Customized LLVM binaries for Solana

Builds LLVM binaries that incorporate customizations and fixes required
by Solana but not yet upstreamed into the LLVM mainline.

* Builds LLVM for Linux (Debian)
* Builds LLVM for MacOS natively therefore skipped if not building on a Mac
* Results in tarballs in `/deploy` that can be released

### Building

```bash
$ ./build.sh
```

* Builds LLVM for Linux in Docker, tags and pushes `solanalabs/llvm`
* Copies LLVM for Linux out of Docker the zips the products into `/deploy`
* Builds LLVM for MacOS natively and zips the products into `/deploy`

### Releases

This repo depends on the following:

* https://github.com/solana-labs/llvm
* https://github.com/solana-labs/clang
* https://github.com/solana-labs/clang-tools-extra
* https://github.com/solana-labs/compiler-rt
* https://github.com/solana-labs/lld

Any changes that need to go into an LLVM release must be made in the appropriate repos listed above.

* See `linux/Dockerfile` for an example of how to sync and build for Linux
* See `macos/build.sh` for an example of how to sync and build for MacOS
