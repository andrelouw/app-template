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
      options: .options(
        automaticSchemesOptions: .disabled
      ),
      targets: [
        .makeAppTarget(
          name: name,
          productName: name,
          platforms: platforms,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: "\(name)App",
          platforms: platforms,
          dependencies: [
            .target(name: "\(name)App")
          ]
        )
      ],
      fileHeaderTemplate: .string("")
    )
  }

  public static func foundationModule(
    name: String,
    platform: Platform,
    hasResources: Bool = false,
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
    hasResources: Bool = false,
    dependencies: [TargetDependency] = []
  ) -> Project {
    Project(
      name: name,
      options: .options(
        automaticSchemesOptions: .disabled
      ),
      targets: [
        .makeFrameworkTarget(
          name: name,
          platforms: platforms,
          hasResources: hasResources,
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
      options: .options(
        automaticSchemesOptions: .disabled
      ),
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
        ),
         .makeAppTarget(
          name: name,
          productName: "\(name)App",
          platforms: platforms,
          dependencies: [
            .target(name: name)
          ]
        )
      ]
    )
  }
}

