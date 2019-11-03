#!/usr/bin/env bash
set -e

if [[ -z "${1}" ]] ; then
    echo "version file not defined ";
    exit 1
fi

if [[ -z "${2}" ]] ; then
    echo "Version not defined ";
    exit 1
fi
version=${2}
version_file=${1}

sed 's/'${version}'/''/g' <<<"$version"

version="${version//v/$''}"
echo "version ${version}"

echo "version file $version_file"

echo "overriding version field"
sed -i 's/VERSION = .*/VERSION = "'${version}'"/1' version.py