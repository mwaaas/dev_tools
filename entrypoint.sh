#!/usr/bin/env bash
set -e

if [[ -z "${1}" ]] ; then
    echo "function not defined ";
    exit 1
fi

./$1.sh ${@:2}