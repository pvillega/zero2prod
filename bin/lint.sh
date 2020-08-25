#!/usr/bin/env bash
dir="$( cd "$( dirname "$0" )" && pwd )"
cd "${dir}"/.. || exit

echo "Run clippy as linter, fail on warnings"
cargo clippy -- -D warnings