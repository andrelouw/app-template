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
      bundleId: bundleID(name: name),
      infoPlist: "\(name)App/Config/Info.plist",
      sources: ["\(name)App/Sources/**"],
      resources: ["\(name)App/Resources/**"],
      dependencies: dependencies
    )
  }

  static func makeTestTarget(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: "\(name)Tests",
      platform: platform,
      product: .unitTests,
      bundleId: bundleID(name: "\(name)Tests"),
      infoPlist: "\(name)Tests/Config/Info.plist",
      sources: ["\(name)Tests/Tests/**"],
      dependencies: dependencies
    )
  }

  static func makeFrameworkTarget(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: name,
      platform: platform,
      product: .framework,
      bundleId: bundleID(name: "\(name)"),
      infoPlist: "\(name)/Config/Info.plist",
      sources: ["\(name)/Sources/**"],
      dependencies: dependencies
    )
  }
}
