#!/usr/bin/env bash
set -e

if [[ -z "${VERSION}" ]] ; then
    echo "Version not defined ";
    exit 1
fi

sed 's/'${VERSION}'/''/g' <<<"$VERSION"

VERSION="${VERSION//v/$''}"
echo "version ${VERSION}"

printf "[distutils]\nindex-servers = pypi \n[pypi]\nusername:${PYPI_USER}\npassword:${PYPI_PASSWORD}\n" > ~/.pypirc

echo "version file $1"

if [[ ! -z "$1" ]] ; then
    echo "overriding version field"
    sed -i  's/VERSION = .*/'VERSION="'${VERSION}'"'/' "$1"
fi

rm -r -f dist/

python setup.py sdist

if [[ ! -z "$1" ]] ; then
    echo "checking out version file"
    git checkout "$1" || true # ignore error here in case it happens
fi

twine upload dist/*
