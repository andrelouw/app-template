import ProjectDescription

extension TargetDependency {
  public static func foundation(_ name: String) -> TargetDependency {
    .project(
      target: name,
      path: .relativeToRoot("Modules/Foundation/\(name)")
    )
  }

  public static func feature(_ name: String) -> TargetDependency {
    .project(
      target: name,
      path: .relativeToRoot("Modules/Features/\(name)")
    )
  }
}
