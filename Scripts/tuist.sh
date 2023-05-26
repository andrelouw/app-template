#!/bin/bash
CHECK_TUIST="command -v tuist > /dev/null 2>&1"

install_tuist() {
	echo "⬇️  Installing `tuistenv`..."
	curl -Ls https://install.tuist.io | bash
	echo "✅ tuistenv installed, tuist will be install when running tuist for the first time"
}

install_tuist_if_needed() {
	if ! eval $CHECK_TUIST; then
		if [[ -z "${CI}" ]]; then
			while true; do
				read -p "Do you wish to install Tuist? (y/n) " yn
				case $yn in
					[Yy]* ) install_tuist; break;;
					[Nn]* ) echo "⛔️ Tuist required to continue, exiting!"; exit 1;;
					* ) echo "Please answer y(yes) or n(no).";;
				esac
			done

		else
			echo "⚙️ Running on CI, skipping confirmation step..."
			install_tuist
		fi
	else
		echo "✅ Tuist installed "
	fi
}

 install_tuist_if_needed
