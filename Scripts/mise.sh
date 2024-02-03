#!/bin/bash

# TODO: Only install mise if required
# Install mise to ~/.local/bin/mise
curl https://mise.run | sh
# Ensure mise is activated everytime a new shell session starts
echo 'eval "$(~/.local/bin/mise activate zsh)"' >>"${ZDOTDIR-$HOME}/.zshrc"
# Activate mise for this script session
~/.local/bin/mise activate --shims
# Install (upgrade) all missing tools in .mise.toml
~/.local/bin/mise up
