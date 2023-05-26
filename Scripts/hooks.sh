#!/bin/sh
CHECK_PRE_COMMIT="command -v pre-commit > /dev/null 2>&1"

if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

install_pre_commit() {
	echo "⬇️  Installing pre-commit..."
	brew install pre-commit
}

install_pre_commit_if_needed() {
	if ! eval $CHECK_PRE_COMMIT; then
		while true; do
			read -p "Do you wish to install pre-commit? (y/n) " yn
			case $yn in
				[Yy]* ) install_pre_commit; break;;
				[Nn]* ) echo "⛔️ pre-commit required for setup, exiting!"; exit 1;;
				* ) echo "Please answer y(yes) or n(no).";;
			esac
		done
	else
		echo "✅ pre-commit already installed "
	fi
}

bootstrap_hooks() {
    echo "⬇️  Installing git hooks..."
    pre-commit install -f -t pre-commit
	pre-commit install -f -t pre-push
    pre-commit run
}

install_pre_commit_if_needed
bootstrap_hooks
