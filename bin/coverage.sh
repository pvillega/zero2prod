#!/usr/bin/env bash
dir="$( cd "$( dirname "$0" )" && pwd )"
cd "${dir}"/.. || exit

echo "Running coverage check. Needs Docker as it only supports Linux executables. For instructions on how to upload to coverage sites, see https://github.com/xd009642/tarpaulin#travis-ci-and-coverage-sites"
docker run --security-opt seccomp=unconfined -v "${PWD}:/volume" xd009642/tarpaulin
