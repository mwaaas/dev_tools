#!/usr/bin/env bash
set -e


if [[ -z "${1}" ]] ; then
    echo "version file not defined ";
    exit 1
fi

echo "checking out version file"
git checkout "$1" || true # ignore error here in case it happens