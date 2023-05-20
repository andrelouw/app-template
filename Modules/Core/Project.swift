import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.foundationModule(
  name: "Core",
  platforms: [.iOS, .macOS] // iOS needs to be first to prevent tuist errors, since tuist does not support multi platform yet
)
