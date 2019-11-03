#!/usr/bin/env bash
set -e

printf "[distutils]\nindex-servers = pypi \n[pypi]\nusername:${PYPI_USER}\npassword:${PYPI_PASSWORD}\n" > ~/.pypirc

twine upload dist/*
