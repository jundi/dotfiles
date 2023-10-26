#!/bin/bash
set -e

VENV_HOME=~/.venv
DEFAULT_PACKAGES="pip pytest pdbpp setuptools_scm"

original_pwd=$PWD

# Activate existing virtual environment
while [[ $PWD != "/" ]]; do

	venv=$VENV_HOME/$PWD/__venv

	if [[ -d $venv ]]; then
		echo "Found virtualenv in $PWD"
		source $venv/bin/activate
		break
	fi

	cd ..
done

cd $original_pwd

# Create a virtual environment if it does not exist already
if [[ -z "$VIRTUAL_ENV" ]]; then


	read -p "Create new virtualenv for $PWD? [Y/n]: " answer
	answer=${answer:-Y}

	case $answer in y|Y|yes|Yes)
		echo "Creating new virtualenv in $PWD"
		venv=$VENV_HOME/$PWD/__venv
		python -m venv $venv --prompt "\[\033[44m\]$(basename $PWD)\[\033[00m\]"
		source $venv/bin/activate
		pip install $DEFAULT_PACKAGES --upgrade
		;;

		*)
		echo "Virtualenv not created"
	esac
fi

set +e
