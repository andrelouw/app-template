## Project Structure
At the root of the folder you will find all the config files, see the [Tools](#tools) section for more info on each config file.

The remaining folders are like follows, see each section below for more detail on each

```
.
├── Apps
├── Modules
├── Tuist
├── TestPlans
└── Workspace.swift
```

### Apps
The Apps folder contains the main project file for the `iOS` app, and all future apps and app extensions will be added in this folder.

```
Apps
└── iOS
    ├── Derived
    │   └── Sources
    ├── Project.swift
    ├── iOSApp
    │   ├── Config
    │   ├── Resources
    │   └── Sources
    └── iOSAppTests
        ├── Config
        └── Tests
```

The `iOSApp` directory contains the [source files](#sources), [resources](#resources) and  [config](#config), for the `iOS` app.
The `iOSAppTests` directory contains the [test files](#tests) and test target [config](#config).
See the [Project.swift](#projectswift) and [Derived](#derived) sections for more details on the remaing conponents in the `iOS` directory.

### Modules
Modules are divided into two categories, namely `Foundation` and `Feature` modules.

- `Foundation` modules contain foundational tools that are combined to build other modules.
- `Feature` modules contain features that the user can feel and interact with. They are built by combining foundation modules, and sometimes other feature modules.

Refer to [µFeatures Architecture](https://docs.tuist.io/building-at-scale/microfeatures/) for more information on this topic.


#### Foundation
Foundation modules has a sources target and a test target. The sources target can have more or less directories depending on the type of module:

Sources Target:
- Sources - Contains the source code of the module
- Resources - Contains the resources of the module if applicable
- Config - Contains the config for the sources target

> The sources target always has the same name as the module

Tests Target:
- Tests - Contains the test code of the module
- Config - Contains the config for the test target

The example below shows the contents of the `Core` module, which doesn't have resources.

```
Modules/Foundation/Core
├── Core
│   ├── Config
│   └── Sources
├── CoreTests
│   ├── Config
│   └── Tests
└── Project.swift
```

See the [Project.swift](#projectswift) and [Derived](#derived) sections for more details on the remaing conponents in the directory.


#### Feature
Feature modules has source, test and example app targets.

Sources Target:
- Sources - Contains the source code of the module
- Resources - Contains the resources of the module. e.g. xcassets and strings.
- Config - Contains the config for the sources target

> The sources target always has the same name as the module

Tests Target:
- Tests - Contains the test code of the module
- Config - Contains the config for the test target

Example App Target:
Serves as a mini app that can be run in isolation, show casing the contents of the feature module.
The components in this target is similar to the main app target.

The example below shows the contents of the `Welcome` module, which doesn't have resources.

```
Modules/Features/Welcome
├── Derived
├── Project.swift
├── Welcome
│   ├── Config
│   ├── Resources
│   └── Sources
├── WelcomeApp
│   ├── Config
│   ├── Resources
│   └── Sources
└── WelcomeTests
    ├── Config
    └── Tests
```

### Tuist
The `Tuist` directory holds all the `ProjectDescriptionHelpers` which powers all the `Tuist` commands and automation.

See [the Tuist docs](https://docs.tuist.io/guides/helpers) for more details.

### Test Plans
This directory contains the project's test plans.

### Workspace.swift
The `Workspace.swift` file serves as the manifest to generate the main workspace for the project using [Tuist](#tuist).

See [the Tuist docs](https://docs.tuist.io/manifests/workspace) for more details.

### Project.swift
The `Project.swift` file serves as the manifest to generate an Xcdoe poject using [Tuist](#tuist). Each module has it's own project file.

See [the Tuist docs](https://docs.tuist.io/manifests/project) for more details.

### Derived
When generating a project or workspace using tuist, all resources will be turned into swift code so all resources can be accessed in a type safe way. The generated files will be stored in the `Derived` folder of each project respectively.

See [the Tuist docs](https://docs.tuist.io/guides/resources#resourcesynthesizers) for more details.
