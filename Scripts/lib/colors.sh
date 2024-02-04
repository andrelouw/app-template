#!/usr/bin/env bash

set -euo pipefail

# Reset
color_off='\033[0m' # Text Reset

# Regular Colors
black='\033[0;30m'  # Black
red='\033[0;31m'    # Red
green='\033[0;32m'  # Green
yellow='\033[0;33m' # Yellow
blue='\033[0;34m'   # Blue
purple='\033[0;35m' # Purple
cyan='\033[0;36m'   # Cyan
white='\033[0;37m'  # White

# Underline
underline='\033[4m' # Underline

# Bold
bold='\033[1m' # Bold

# Function to print text with optional coloring, bold, underline, and a default color
# Usage information (previously for -h argument):
#
# Usage: print [options] <text>
# Options:
#   --color <color>   Specify the color of the text.
#   --bold            Apply bold style to the text.
#   --underline       Apply underline style to the text.
#   --color-words     Comma-separated list of word indices to color (0-based).
#                     If not specified, all words are colored according to --color.
#   --default-color   Specify the color for words not listed in --color-words.
#                     Defaults to terminal's default if not specified.
#
# Colors:
#   Supported colors include red, green, gray, and others defined in the script.
#
# Example:
# print --color blue --bold --underline --color-words 0,2 "This is a test message."
# print --color yellow --color-words 1,3 --default-color cyan "This function supports selective coloring."
print() {
	local primary_color="color_off" # Default to use terminal default color
	local is_bold=false
	local is_underline=false
	local color_words=()          # Empty array to hold word indices
	local apply_color_to_all=true # Default behavior
	local default_color=""        # Use terminal default color for uncolored text
	local text=""
	local args=("$@") # Capture all remaining arguments

	# Parse optional arguments
	for ((i = 0; i < "${#args[@]}"; i++)); do
		case "${args[$i]}" in
		--color)
			primary_color="${args[$((i + 1))]}"
			((i++)) # Skip next argument since it's part of --color
			;;
		--bold)
			is_bold=true
			;;
		--underline)
			is_underline=true
			;;
		--color-words)
			apply_color_to_all=false
			IFS=',' read -r -a color_words <<<"${args[$((i + 1))]}" # Split string into array
			((i++))                                                 # Skip next argument since it's part of --color-words
			;;
		--default-color)
			default_color="${args[$((i + 1))]}" # Set default color from argument
			((i++))                             # Skip next argument since it's part of --default-color
			;;
		*)
			text="${args[@]:$i}" # Assign remaining arguments as text
			break                # Exit loop after capturing text
			;;
		esac
	done

	local primary_text_style="${!primary_color:-$color_off}"
	[ "$is_bold" == "true" ] && primary_text_style+="${bold}"
	[ "$is_underline" == "true" ] && primary_text_style+="${underline}"
	local default_text_style="${!default_color:-$color_off}"

	# Process text for selective coloring
	if [ "$apply_color_to_all" == "true" ]; then
		echo -e "${primary_text_style}${text}${color_off}"
	else
		local -a words=($text) # Split text into array of words
		for i in "${!words[@]}"; do
			if [[ " ${color_words[@]} " =~ " $i " ]]; then
				echo -ne "${primary_text_style}${words[$i]}${color_off} "
			else
				echo -ne "${default_text_style}${words[$i]}${color_off} "
			fi
		done
		echo # Newline at end
	fi
}
