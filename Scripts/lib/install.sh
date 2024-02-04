#!/usr/bin/env bash

set -euo pipefail

current_script_path=${BASH_SOURCE[0]}
scripts_dir=$(dirname "$(dirname "$current_script_path")")

source "${scripts_dir}/lib/utils.sh"
# The name of the program to check
program_name=""

# Installation command passed as the second argument
install_command=""

_print_usage_and_exit() {
	fail "Wrong usage of install_if_needed in $0. Usage: install_if_needed program_name 'install_command'"
}

_check_if_installed() {
	which "$program_name" &>/dev/null
}

# Function to install the program using the command provided as an argument
_install_program() {
	print_info "Installing $program_name..."
	eval "$install_command"
	print_success "Successfully installed $program_name"
}

install_if_needed() {
	# Check for the correct number of arguments
	if [ "$#" -ne 2 ]; then
		_print_usage_and_exit
	fi

	program_name=$1
	install_command=$2

	if [ -z "$program_name" ] || [ -z "$install_command" ]; then
		_print_usage_and_exit
	fi

	if _check_if_installed; then
		print_success "$program_name is already installed"
	else
		_install_program
	fi
}
