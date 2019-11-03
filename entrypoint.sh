#!/usr/bin/env bash
set -e

if [[ -z "${1}" ]] ; then
    echo "function not defined ";
    exit 1
fi

/app_script//$1.sh ${@:2}