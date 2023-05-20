import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
  name: ProjectConfiguration.appName,
  platform: .iOS,
  dependencies: [
    .foundation("Core")
  ]
)
