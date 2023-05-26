import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
  name: "iOS",
  platform: .iOS,
  dependencies: [
    .foundation("Core"),
    .foundation("UI"),
    .feature("Welcome"),
  ]
)
