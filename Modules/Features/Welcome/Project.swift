import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureModule(
  name: "Welcome",
  platform: .iOS,
  dependencies: [
    .foundation("Core"),
    .foundation("UI"),
  ]
)
