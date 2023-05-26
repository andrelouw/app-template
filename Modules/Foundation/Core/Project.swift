import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.foundationModule(
  name: "Core",
  platform: .iOS
    .with(supportedPlatforms: .macOS) // Main app platform needs to be base for now while tuist does not support multiplatform. After that we can pick and choose as we like
)
