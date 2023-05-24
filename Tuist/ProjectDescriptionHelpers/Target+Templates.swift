import ProjectDescription

extension Target {
  static func bundleID(name: String) -> String {
    "\(ProjectConfiguration.bundleID).\(ProjectConfiguration.appName).\(name)"
  }

  static func makeAppTarget(
    name: String,
    productName: String? = nil,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: "\(name)App",
      platform: platform,
      product: .app,
      productName: productName,
      bundleId: bundleID(name: "\(name)App"),
      infoPlist: "\(name)App/Config/Info.plist",
      sources: ["\(name)App/Sources/**"],
      resources: ["\(name)App/Resources/**"],
      dependencies: dependencies,
      settings: .base(platformSet: platform.asPlatformSet())
    )
  }

  static func makeTestTarget(
    name: String,
    platform: PlatformSet,
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: "\(name)Tests",
      platform: platform.base,
      product: .unitTests,
      bundleId: bundleID(name: "\(name)Tests"),
      infoPlist: "\(name)Tests/Config/Info.plist",
      sources: ["\(name)Tests/Tests/**"],
      dependencies: dependencies,
      settings: .base(platformSet: platform)
    )
  }

  static func makeFrameworkTarget(
    name: String,
    platform: PlatformSet,
    hasResources: Bool = false,
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: name,
      platform: platform.base,
      product: .framework,
      bundleId: bundleID(name: "\(name)"),
      infoPlist: "\(name)/Config/Info.plist",
      sources: ["\(name)/Sources/**"],
      resources: hasResources ? ["\(name)/Resources/**"] : [],
      dependencies: dependencies,
      settings: .base(platformSet: platform)
    )
  }
}
