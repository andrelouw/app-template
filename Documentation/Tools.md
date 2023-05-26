## Tools
The tools used in this project are:

### Homebrew
[Homebrew](https://brew.sh) is used to install the follwiong tools
- [Mint](#mint)
- [pre-commit](#pre-commit)

The brews that will be installed when running `make bootstrap` are defined in the project's `Brewfile`.

### Tuist
This project uses [Tuist](https://tuist.io) to manage the Xcode projects and workspace.
Tuist (`tuistenv`) will be installed when running `make bootstrap` or `make tuist`.

See the [documentation](https://docs.tuist.io/tutorial/get-started) for more details.

The `.tuist-version` specifies the current version used for this project.

### Mint
[Mint](https://github.com/yonaskolb/Mint) is used as the package manager for Swift command line tools. The follwoing tools are installed and managed by `Mint`:
- [Swiftlint](#swiftlint)
- [Swiftformat](#swiftformat)

The packages that will be installed by `Mint` when running `make bootstrap` are definedin the project's `Mintfile`

### pre-commit
[Pre-commit](https://pre-commit.com) is used to manage the git hooks for this project.

The hooks that will be installed during `make bootstrap` is defined in `.pre-commit-config.yml`.

### Swiftlint
[Swiftlint](https://github.com/realm/SwiftLint) is used to lint and format all swift files in the project, in conjuction with [Swiftformat](#swiftformat).
Airbnb
All `swiftlint` rules being used are defined in `.swiftlint.yml`.

> The [Airbnb](https://github.com/airbnb/swift)'s style guide was used as a starting point

### Swiftformat
[Swiftformat](https://github.com/nicklockwood/SwiftFormat) is used to lint and format all swift files in the project, in conjuction with [Swiftlint](#swiftlint).

All `swiftformat` rules being used are defined in `.swiftformat`.

> The [Airbnb](https://github.com/airbnb/swift)'s style guide was used as a starting point

### Xcode
The `.xcode-version` defines the Xcode version that will be used durin CI runs.

### Github Actions
This project uses GitHub actions as the CI runner.
On each push to `develop` the following workflows will run:
-  [CI-iOS]().github/workflows/ci-ios.yml)
-  [CI-macOS]().github/workflows/ci-macos.yml)

### Scripts
A lot of scripts written in bash are used for setting up the project. These can be found under the `Scrips` directory.

The following commands are needed on the local machine for these scripts to run:
- `sed` - used to manipulate text files
- `awk` - in used to manipulate strings
