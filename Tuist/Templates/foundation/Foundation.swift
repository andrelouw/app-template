import ProjectDescription

/// # Usage
///
/// In root of the app, run:
/// `tuist scaffold foundation --name MyProject`
///
/// This will create a new Foundation project named `MyProject` under `Modules/` for platforms `macOS` by default.
///
/// To specify a platform add the `--platforms` attribute as follows:
/// `tuist scaffold foundation --name MyProject --platforms  iOS`
///
/// For multiple platforms, seperate them by `,`:
/// `tuist scaffold foundation --name MyProject --platforms  iOS,tvOS`

let nameAttribute: Template.Attribute = .required("name")
let platformsAttribute: Template.Attribute = .optional("platforms", default: "macOS")

func modulePath(_ path: String) -> String {
  "\(nameAttribute)/\(path)"
}

let template = Template(
  description: "A Foundation type module template",
  attributes: [
    nameAttribute,
    platformsAttribute,
  ],
  items: [
    .file(
      path: modulePath("Project.swift"),
      templatePath: "ProjectFile.stencil"
    ),
    .file(
      path: modulePath("\(nameAttribute)/Sources/\(nameAttribute).swift"),
      templatePath: "SourceFile.stencil"
    ),
    .file(
      path: modulePath("\(nameAttribute)/Config/Info.plist"),
      templatePath: "FrameworkInfo.plist"
    ),
    .file(
      path: modulePath("\(nameAttribute)Tests/Tests/\(nameAttribute)Tests.swift"),
      templatePath: "TestsFile.stencil"
    ),
    .file(
      path: modulePath("\(nameAttribute)Tests/Config/Info.plist"),
      templatePath: "FrameworkTestsInfo.plist"
    ),
  ]
)
