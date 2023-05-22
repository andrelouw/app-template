import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureModule(
  name: "Welcome",
  platforms: [.iOS],
   dependencies: [
    .foundation("Core"),
    .foundation("UI")
  ]
)
