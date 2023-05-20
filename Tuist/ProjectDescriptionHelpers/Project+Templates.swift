import ProjectDescription

extension Project {
  // TODO: Derive app name from platform
  public static func app(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Project {
    Project(
      name: name,
      targets: [
        .makeAppTarget(
          name: "iOS",
          productName: name,
          platform: platform,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: "iOSApp",
          platform: platform,
          dependencies: [
            .target(name: "iOSApp")
          ]
        )
      ]
    )
  }

  // TODO: Allow multiple platforms
  public static func foundationModule(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Project {
    Project(
      name: name,
      targets: [
        .makeFrameworkTarget(
          name: name,
          platform: platform,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: name,
          platform: platform,
          dependencies: [
            .target(name: name)
          ]
        )
      ]
    )
  }
}

