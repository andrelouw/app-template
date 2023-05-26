#!/bin/sh
DIR="${BASH_SOURCE%/*}"

if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which mint > /dev/null; then
  mint run swiftlint lint --fix --format --progress --config $DIR/../.swiftlint.yml
  mint run swiftformat --config $DIR/../.swiftformat .
else
  echo "warning: Mint not installed, formating won't work. Install using `make bootstrap`. "
fi