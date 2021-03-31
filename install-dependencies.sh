#!/usr/bin/env bash

# install pip
sudo apt-get install -y git python3-pip

# install base python modules
python3 -m pip install -r requirements.txt --upgrade
python3 -m pipx ensurepath

# now use pipx to install the rest
pipx install ansible # IT automation
pipx install molecule # Testing
pipx install pre-commit
pipx install yamllint # YAML lint tool
pipx install ansible-lint # Ansible lint tool

# install git hook scripts
pre-commit install
