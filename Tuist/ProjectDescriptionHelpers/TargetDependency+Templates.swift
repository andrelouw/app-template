import ProjectDescription

extension TargetDependency {
  public static func foundation(_ name: String) -> TargetDependency {
    .project(
      target: name,
      path: .relativeToRoot("Modules/\(name)")
    )
  }
}
