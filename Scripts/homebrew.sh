#!/bin/bash
CHECK_HOMEBREW="command -v brew > /dev/null 2>&1"

install_homebrew() {
	echo "⬇️  Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

update_homebrew() {
	echo "⬇️  Updating Homebrew..."
	brew update
}

install_brews() {
	echo "⬇️  Installing brews from Brewfile..."
	brew bundle --file Brewfile
}

install_homebrew_if_needed() {
	if ! eval $CHECK_HOMEBREW; then 
		while true; do
			read -p "Do you wish to install Homebrew? (y/n) " yn
			case $yn in
				[Yy]* ) install_homebrew; break;;
				[Nn]* ) echo "⛔️ Homebrew required for setup, exiting!"; exit 1;;
				* ) echo "Please answer y(yes) or n(no).";;
			esac
		done
	else
		echo "✅ Homebrew already installed "
	fi
}

update_homebrew_if_needed() {
	while true; do
		read -p "Do you wish to update Homebrew? (y/n) " yn
		case $yn in
			[Yy]* ) update_homebrew; break;;
			[Nn]* ) echo "⏭️  Skipping upate"; break;;
			* ) echo "Please answer y(yes) or n(no).";;
		esac
	done
}

install_brews_if_needed() {
	while true; do
		read -p "Do you wish to install the brew in the Brewfile? (y/n) " yn
		case $yn in
			[Yy]* ) install_brews; break;;
			[Nn]* ) echo "⏭️  Skipping install"; break;;
			* ) echo "Please answer y(yes) or n(no).";;
		esac
	done
}

echo "🍻 Bootstrapping Homebrew..."
install_homebrew_if_needed
update_homebrew_if_needed
install_brews_if_needed
