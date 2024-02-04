#!/usr/bin/env bash

set -euo pipefail

# current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#
# source "$current_dir/colors.sh"
current_script_path=${BASH_SOURCE[0]}
scripts_dir=$(dirname "$(dirname "$current_script_path")")

source "${scripts_dir}/lib/colors.sh"

fail() {
	print_error $*
	# echo_color_first red "ERROR:" $*
	exit 1
}

print_message() {
	print --color white $*
}

print_error() {
	print --color red --color-words 0 --default-color white "ERROR: $*"
}

print_warning() {
	print --color yellow "$*"
}

print_success() {
	print --color green $*
}

print_info() {
	print --color cyan $*
}

print_header() {
	echo
	print --color blue --bold --underline $*
	echo
}
