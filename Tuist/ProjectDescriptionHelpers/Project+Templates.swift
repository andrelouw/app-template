import ProjectDescription

extension Project {
  public static func app(
    name: String,
    platform: Platform,
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
          platform: platform,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: "\(name)App",
          platform: platform.asPlatformSet(),
          dependencies: [
            .target(name: "\(name)App"),
          ]
        ),
      ],
      fileHeaderTemplate: .string("")
    )
  }

  public static func foundationModule(
    name: String,
    platforms: [Platform],
    hasResources: Bool = false,
    dependencies: [TargetDependency] = []
  ) -> Project {
    foundationModule(
      name: name,
      platform: platforms.asPlatformSet(),
      hasResources: hasResources,
      dependencies: dependencies
    )
  }

  public static func foundationModule(
    name: String,
    platform: PlatformSet,
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
          platform: platform,
          hasResources: hasResources,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: name,
          platform: platform,
          dependencies: [
            .target(name: name),
          ]
        ),
      ]
    )
  }

  public static func featureModule(
    name: String,
    platforms: [Platform],
    exampleAppPlatform: Platform? = nil,
    dependencies: [TargetDependency] = []
  ) -> Project {
    featureModule(
      name: name,
      platform: platforms.asPlatformSet(),
      exampleAppPlatform: exampleAppPlatform,
      dependencies: dependencies
    )
  }

  public static func featureModule(
    name: String,
    platform: PlatformSet,
    exampleAppPlatform: Platform? = nil,
    dependencies: [TargetDependency] = []
  ) -> Project {
    let appPlatform = exampleAppPlatform ?? platform.base

    return Project(
      name: name,
      options: .options(
        automaticSchemesOptions: .disabled
      ),
      targets: [
        .makeFrameworkTarget(
          name: name,
          platform: platform,
          hasResources: true,
          dependencies: dependencies
        ),
        .makeTestTarget(
          name: name,
          platform: platform,
          dependencies: [
            .target(name: name),
          ]
        ),
        .makeAppTarget(
          name: name,
          productName: "\(name)App",
          platform: appPlatform,
          dependencies: [
            .target(name: name),
          ]
        ),
      ]
    )
  }
}
