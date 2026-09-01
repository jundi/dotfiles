#!/bin/bash
set -e

DEFAULT_PACKAGES="pytest pdbpp"

original_pwd=$PWD

# Activate existing virtual environment
while [[ $PWD != "/" ]]; do

	venv=$PWD/.venv-$(hostname -s)

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


	if [[ -t 0 ]]; then
		read -p "Create new virtualenv for $PWD? [Y/n]: " answer
		answer=${answer:-Y}
	else
		echo "Non-interactive shell detected, creating virtualenv without prompting"
		answer=Y
	fi

	case $answer in y|Y|yes|Yes)
		echo "Creating new virtualenv in $PWD"
		venv=$PWD/.venv-$(hostname -s)
		uv venv $venv --prompt "\[\033[44m\]$(basename $PWD)\[\033[00m\]"
		source $venv/bin/activate
		uv pip install $DEFAULT_PACKAGES
		;;

		*)
		echo "Virtualenv not created"
	esac
fi

set +e
