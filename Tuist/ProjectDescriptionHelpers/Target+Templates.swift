import ProjectDescription

extension Target {
  static func bundleID(name: String) -> String {
    "\(ProjectConfiguration.bundleID).\(ProjectConfiguration.appName).\(name)"
  }

  static func makeAppTarget(
    name: String,
    productName: String? = nil,
    platforms: [Platform],
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: "\(name)App",
      platform: platforms.primary,
      product: .app,
      productName: productName,
      bundleId: bundleID(name: name),
      infoPlist: "\(name)App/Config/Info.plist",
      sources: ["\(name)App/Sources/**"],
      resources: ["\(name)App/Resources/**"],
      dependencies: dependencies,
      settings: .base(for: platforms)
    )
  }

  static func makeTestTarget(
    name: String,
    platforms: [Platform],
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: "\(name)Tests",
      platform: platforms.primary,
      product: .unitTests,
      bundleId: bundleID(name: "\(name)Tests"),
      infoPlist: "\(name)Tests/Config/Info.plist",
      sources: ["\(name)Tests/Tests/**"],
      dependencies: dependencies,
      settings: .base(for: platforms)
    )
  }

  static func makeFrameworkTarget(
    name: String,
    platforms: [Platform],
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: name,
      platform: platforms.primary,
      product: .framework,
      bundleId: bundleID(name: "\(name)"),
      infoPlist: "\(name)/Config/Info.plist",
      sources: ["\(name)/Sources/**"],
      dependencies: dependencies,
      settings: .base(for: platforms)
    )
  }
}
