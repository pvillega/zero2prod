#!/usr/bin/env bash
dir="$( cd "$( dirname "$0" )" && pwd )"
cd "${dir}"/.. || exit

echo "Prepare sqlx metadata for the project"
# It must be invoked as a cargo subcommand
# All options after `--` are passed to cargo itself
# We need to point it to our binary using --bin
cargo sqlx prepare -- --bin app

echo "Builds a docker image for the application"
# Build a docker image tagged as "zero2prod" according to the recipe
# specified in `Dockerfile`
docker build --tag zero2prod --file Dockerfile .