#!/usr/bin/env bash

set -euo pipefail

current_script_path=${BASH_SOURCE[0]}
scripts_dir=$(dirname "$(dirname "$current_script_path")")

source "${scripts_dir}/lib/utils.sh"
line_to_add=""
file=""

_print_usage_and_exit() {
	fail "Wrong usage of append_to_file_if_needed in $0. Usage: append_to_file_if_needed 'line_to_add' 'file'"
}
#
# Function to check if a line exists in a file
_line_exists_in_file() {
	local line="$1"
	local file="$2"

	grep -qF -- "$line" "$file"

	# Return the exit status of grep
	return $?
}

_append_line_to_file() {
	local line="$1"
	local file="$2"

	echo "$line" >>"$file"
}

# Function to add a line to a file if it does not already exist
append_to_file_if_needed() {
	if [ "$#" -ne 2 ]; then
		_print_usage_and_exit
	fi

	local line_to_add="$1"
	local file="$2"

	if ! _line_exists_in_file "$line_to_add" "$file"; then
		_append_line_to_file "$line_to_add" "$file"
		print_info "$line_to_add added to $file"
	else
		print_success "$line_to_add already exists in $file"
	fi
}
