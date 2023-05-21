import ProjectDescription

extension Project {
  public static func app(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Project {
    app(
      name: name,
      platforms: [platform],
      dependencies: dependencies
    )
  }

  // TODO: [3] Derive app name from platform
  public static func app(
    name: String,
    platforms: [Platform],
    dependencies: [TargetDependency] = []
  ) -> Project {
    Project(
      name: name,
      targets: [
        .makeAppTarget(
          name: "iOS",
          productName: name,
          platforms: platforms,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: "iOSApp",
          platforms: platforms,
          dependencies: [
            .target(name: "iOSApp")
          ]
        )
      ]
    )
  }

  public static func foundationModule(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Project {
    foundationModule(
      name: name,
      platforms: [platform],
      dependencies: dependencies
    )
  }

  public static func foundationModule(
    name: String,
    platforms: [Platform],
    dependencies: [TargetDependency] = []
  ) -> Project {
    Project(
      name: name,
      targets: [
        .makeFrameworkTarget(
          name: name,
          platforms: platforms,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: name,
          platforms: platforms,
          dependencies: [
            .target(name: name)
          ]
        )
      ]
    )
  }

  public static func featureModule(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Project { 
     featureModule(
      name: name,
      platforms: [platform],
      dependencies: dependencies
    )
  }

  public static func featureModule(
    name: String,
    platforms: [Platform],
    dependencies: [TargetDependency] = []
  ) -> Project {
    Project(
      name: name,
      targets: [
        .makeFrameworkTarget(
          name: name,
          platforms: platforms,
          hasResources: true,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: name,
          platforms: platforms,
          dependencies: [
            .target(name: name)
          ]
        )
      ]
    )
  }
}

