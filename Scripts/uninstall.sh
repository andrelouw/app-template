#!/bin/bash
CHECK_TUIST="command -v tuist > /dev/null 2>&1"
CHECK_TUIST="command -v mint > /dev/null 2>&1"

uninstall_tuist() {
	echo "🗑️  Uninstalling Tuist..."
	curl -Ls https://raw.githubusercontent.com/tuist/tuist/main/script/uninstall | bash
}

uninstall_mint() {
	echo "🗑️  Uninstalling Mint..."
	brew uninstall mint
    rm -rf ~/.mint
}

unisntall_mints() {
    input="Mintfile"
    while IFS= read -r line 
    do
        package=`echo $line | sed -e 's/\(^.*\/\)\(.*\)\(@.*$\)/\2/'`
        echo "🗑️  Unisntalling ${package}..."
        mint uninstall $package
    done < "$input"
}

uninstall_tuist_if_needed() {
	if eval $CHECK_TUIST; then 
		while true; do
			read -p "Do you wish to uninstall tuist? (y/n) " yn
			case $yn in
				[Yy]* ) uninstall_tuist; break;;
				[Nn]* ) echo "⏭️  Skipping tuist uninstall!"; break;;
				* ) echo "Please answer y(yes) or n(no).";;
			esac
		done
	else
		echo "✅ Tuist not found"
	fi
}

uninstall_mint_if_needed() {
	if eval $CHECK_MINT; then 
		while true; do
			read -p "Do you wish to uninstall mint? (y/n) " yn
			case $yn in
				[Yy]* ) uninstall_mint; break;;
				[Nn]* ) echo "⏭️  Skipping mint uninstall!"; break;;
				* ) echo "Please answer y(yes) or n(no).";;
			esac
		done
	else
		echo "✅ Mint not found"
	fi
}

uninstall_mints_if_needed() {
    while true; do
        read -p "Do you wish to uninstall all mints? (y/n) " yn
        case $yn in
            [Yy]* ) unisntall_mints; break;;
            [Nn]* ) echo "⏭️  Skipping mints uninstall!"; break;;
            * ) echo "Please answer y(yes) or n(no).";;
        esac
    done
}

uninstall_mints_if_needed
uninstall_mint_if_needed
uninstall_tuist_if_needed

echo "⚠️  Not uninstalling Homebrew, do that visit: https://osxdaily.com/2018/08/12/how-uninstall-homebrew-mac/"
