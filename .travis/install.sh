#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then
    # install pyenv
    git clone --depth 1 https://github.com/yyuu/pyenv.git ~/.pyenv
    PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    case "${TOXENV}" in
        py27)
            curl -O https://bootstrap.pypa.io/get-pip.py
            python get-pip.py --user
            ;;
        py35)
            pyenv install 3.5.9
            pyenv global 3.5.9
            ;;
        py36)
            pyenv install 3.6.10
            pyenv global 3.6.10
            ;;
        py37)
            pyenv install 3.7.6
            pyenv global 3.7.6
            ;;
        py38)
            pyenv install 3.8.1
            pyenv global 3.8.1
            ;;
    esac
    pyenv rehash
    pip install -U setuptools
    pip install --user virtualenv
else
    pip install virtualenv
fi

pip install tox

