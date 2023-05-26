[![CI-iOS](https://github.com/andrelouw/app-template/actions/workflows/ci-ios.yml/badge.svg)](https://github.com/andrelouw/app-template/actions/workflows/ci-ios.yml)
[![CI-macOS](https://github.com/andrelouw/app-template/actions/workflows/ci-macos.yml/badge.svg)](https://github.com/andrelouw/app-template/actions/workflows/ci-macos.yml)
[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)

> ⚠️ This project is still under active development - be warned 😱

# App Template
This is a basic App template to get up and running with `iOS` or `macOS` projects quickly.

To get started:
- Clone this repo using one of the methods described [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
- Run the folloiwng in the cloned repository:
```
make
```

Running `make` will [bootstrap](Documentation/Commands.md#bootstrap), [rename](Documentation/Commands.md#rename), and [run](Documentation/Commands.md#run) the project for you.

> ℹ️ All installation can be undone with the [`make unboostrap`](Documentation/Commands.md#uninstall)

🎉 Happy coding


## Other details

See the [Commands](Documentation/Commands.md) page for a full list of `make` commands.

See the [Project Structure](Documentation/ProjectStructure.md) page for an overview of the project and directory structure.

See the [Tools](Documentation/Tools.md) page for all the tools used in this project.


## Caveats
- Multiplatform `Feature` modules has not been tested yet, best to keep them to one platform for now
- See issues list for improvments and outstanding features
