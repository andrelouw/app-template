import ProjectDescription

extension TargetScript {
  static let linting = TargetScript.post(
    path: .relativeToRoot("Scripts/lint.sh"),
    name: "Run linting",
    basedOnDependencyAnalysis: false
  )
}

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
      scripts: [
        .linting,
      ],
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
      scripts: [
        .linting,
      ],
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
      scripts: [
        .linting,
      ],
      dependencies: dependencies,
      settings: .base(platformSet: platform)
    )
  }
}
