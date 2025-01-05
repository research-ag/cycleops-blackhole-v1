#!/bin/bash

dfx build --check
OUT=out/blackhole_$(uname -s)_$(uname -m).wasm
cp .dfx/local/canisters/blackhole/blackhole.wasm $OUT
if [ "$compress" == "yes" ] || [ "$compress" == "y" ]; then
  gzip -nf $OUT
  sha256sum $OUT.gz
else
  sha256sum $OUT
fi
