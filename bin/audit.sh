#!/usr/bin/env bash
dir="$( cd "$( dirname "$0" )" && pwd )"
cd "${dir}"/.. || exit

echo "Run audit to detect any vulnerabilities reported against crates we use"
cargo audit