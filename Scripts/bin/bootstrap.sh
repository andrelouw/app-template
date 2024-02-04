#!/usr/bin/env bash

# # TODO: Only install mise if required
# # Install mise to ~/.local/bin/mise
# curl https://mise.run | sh
# # Ensure mise is activated everytime a new shell session starts
# echo 'eval "$(~/.local/bin/mise activate zsh)"' >>"${ZDOTDIR-$HOME}/.zshrc"
# # Activate mise for this script session
# ~/.local/bin/mise activate --shims
# # Install (upgrade) all missing tools in .mise.toml
# ~/.local/bin/mise up

set -euo pipefail

# current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
current_script_path=${BASH_SOURCE[0]}
scripts_dir=$(dirname "$(dirname "$current_script_path")")

# source "$plugin/../lib/install.sh"
source "$scripts_dir/lib/utils.sh"
source "$scripts_dir/lib/install.sh"
source "$scripts_dir/lib/append.sh"

check_if_mise_activated() {
	which "$program_name" &>/dev/null
}

print_header "Bootstrap Project"

install_if_needed mise "curl https://mise.run | sh"
append_to_file_if_needed 'eval "$(~/.local/bin/mise activate zsh)"' "${ZDOTDIR-$HOME}/.zshrc"

if ! check_if_mise_activated; then
	print_info "Activating mise for bootstrapping tools managed by mise"
	eval "$(~/.local/bin/mise activate --shims)"
fi

mise run bootstrap

echo ""
print_success "Succesfully bootrapped project"
echo ""
