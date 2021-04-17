#!/usr/bin/env bash

PYTHON_PROJECT=true
MODULES=""

# install pip
sudo apt-get install -y git python3-pip

# install base python modules
python3 -m pip install --upgrade pip pipx
python3 -m pipx ensurepath

# now use pipx to install the rest
pipx install pre-commit
pipx install yamllint # YAML lint tool
pipx install poetry # Ansible lint tool

# install git hook scripts
if [ ! -d .git ]; then
    git init
fi
pre-commit install

if [ "$PYTHON_PROJECT" = "true" ]; then
    PROJECTNAME="${PROJECTNAME:=$(basename "${PWD}")}"
    # install packages via poetry
    if [ ! -f pyproject.toml ]; then
        poetry new ${PROJECTNAME}
    fi

    # install modules
    if [ "$MODULES" ]; then
        current_dir=$PWD;cd ${PROJECTNAME};poetry add {MODULES};cd $current_dir;
    fi
fi
