#!/bin/sh
DIR="${BASH_SOURCE%/*}"

if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which mint > /dev/null; then
  mint run swiftlint lint  --config $DIR/../.swiftlint.yml
  mint run swiftformat --lint --lenient --config $DIR/../.swiftformat .
else
  echo "warning: Mint not installed, Linting won't work. Install using `make bootstrap`. "
fi