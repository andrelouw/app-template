#!/bin/bash
CHECK_TUIST="command -v tuist > /dev/null 2>&1"

if ! eval $CHECK_TUIST; then 
	echo "⬇️  Installing `tuistenv`..."
	curl -Ls https://install.tuist.io | bash
	echo "✅ `tuistenv` installed, `tuist` will be install when running `tuist` for the first time"
fi
