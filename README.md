# Customized LLVM binaries for Solana

Builds LLVM binaries that incorporate customizations and fixes required
by Solana but not yet upstreamed into the LLVM mainline.

* Builds LLVM for Ubuntu
* Builds LLVM for MacOS natively therefore skipped if not building on a Mac
* Results in tarballs in `/deploy` that can be released
