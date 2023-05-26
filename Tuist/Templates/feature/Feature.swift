import ProjectDescription

/// # Usage
///
/// In root of the app, run:
/// `tuist scaffold feature --name MyProject`
///
/// This will create a new Feature project named `MyProject` under `Modules/` for platforms `macOS` by default.
///
/// To specify a platform add the `--platforms` attribute as follows:
/// `tuist scaffold feature --name MyProject --platforms iOS`
///
/// For multiple platforms, seperate them by `,`:
/// `tuist scaffold foundation --name MyProject --platforms iOS,tvOS`

let nameAttribute: Template.Attribute = .required("name")
let platformsAttribute: Template.Attribute = .optional("platforms", default: "iOS")

func modulePath(_ path: String) -> String {
  "\(nameAttribute)/\(path)"
}

let template = Template(
  description: "A Feature type module template",
  attributes: [
    nameAttribute,
    platformsAttribute,
  ],
  items: [
    .file(
      path: modulePath("Project.swift"),
      templatePath: "ProjectFile.stencil"
    ),
    // Framework
    .file(
      path: modulePath("\(nameAttribute)/Sources/\(nameAttribute)Coordinator.swift"),
      templatePath: "Framework/Sources/CoordinatorFile.stencil"
    ),
    .file(
      path: modulePath("\(nameAttribute)/Sources/\(nameAttribute)View.swift"),
      templatePath: "Framework/Sources/ViewFile.stencil"
    ),
    .file(
      path: modulePath("\(nameAttribute)/Sources/\(nameAttribute)ViewController.swift"),
      templatePath: "Framework/Sources/ViewControllerFile.stencil"
    ),
    .file(
      path: modulePath("\(nameAttribute)/Resources/en.lproj/\(nameAttribute).strings"),
      templatePath: "Framework/Resources/Feature.strings"
    ),
    .directory(
      path: modulePath("\(nameAttribute)/Resources"),
      sourcePath: "Framework/Resources/Assets.xcassets"
    ),
    .file(
      path: modulePath("\(nameAttribute)/Config/Info.plist"),
      templatePath: "Framework/Config/Info.plist"
    ),
    // Tests
    .file(
      path: modulePath("\(nameAttribute)Tests/Config/Info.plist"),
      templatePath: "Tests/Config/Info.plist"
    ),
    .file(
      path: modulePath("\(nameAttribute)Tests/Tests/\(nameAttribute)CoordinatorTests.swift"),
      templatePath: "Tests/Tests/CoordinatorTestsFile.stencil"
    ),
    // Example App
    .directory(
      path: modulePath("\(nameAttribute)App"),
      sourcePath: "ExampleApp/Config"
    ),
    .directory(
      path: modulePath("\(nameAttribute)App"),
      sourcePath: "ExampleApp/Resources/"
    ),
    .directory(
      path: modulePath("\(nameAttribute)App/Sources"),
      sourcePath: "ExampleApp/Sources/App"
    ),
    .file(
      path: modulePath("\(nameAttribute)App/Sources/Main/MainCoordinator.swift"),
      templatePath: "ExampleApp/Sources/Main/MainCoordinator.stencil"
    ),
  ]
)
