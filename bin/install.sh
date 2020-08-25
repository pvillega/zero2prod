#!/usr/bin/env bash
dir="$( cd "$( dirname "$0" )" && pwd )"
cd "${dir}"/.. || exit

echo "Installs tooling for out cargo toolchain"
cargo install cargo-tarpaulin