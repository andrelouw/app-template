import ProjectDescription
import ProjectDescriptionHelpers

extension TestableTarget {
  static func foundation(_ name: String) -> TestableTarget {
    TestableTarget(
      target: .foundationTest(name),
      parallelizable: true,
      randomExecutionOrdering: true
    )
  }

  static func feature(_ name: String) -> TestableTarget {
    TestableTarget(
      target: .featureTest(name),
      parallelizable: true,
      randomExecutionOrdering: true
    )
  }

  static func app(_ name: String) -> TestableTarget {
    TestableTarget(
      target: .appTest(name),
      parallelizable: true,
      randomExecutionOrdering: true
    )
  }
}

extension TargetReference {
  static func foundation(_ name: String) -> TargetReference {
    TargetReference(projectPath: .foundation(name), target: name)
  }

  static func foundationTest(_ name: String) -> TargetReference {
    TargetReference(projectPath: .foundation(name), target: "\(name)Tests")
  }

  static func feature(_ name: String) -> TargetReference {
    TargetReference(projectPath: .feature(name), target: name)
  }

  static func featureTest(_ name: String) -> TargetReference {
    TargetReference(projectPath: .feature(name), target: "\(name)Tests")
  }

  static func app(_ name: String) -> TargetReference {
    TargetReference(projectPath: .app(name), target: "\(name)App")
  }

  static func appTest(_ name: String) -> TargetReference {
    TargetReference(projectPath: .app(name), target: "\(name)AppTests")
  }
}

extension Path {
  static func foundation(_ path: String) -> Path {
    .relativeToRoot("Modules/Foundation/\(path)")
  }

  static func feature(_ path: String) -> Path {
    .relativeToRoot("Modules/Features/\(path)")
  }

  static func app(_ path: String) -> Path {
    .relativeToRoot("Apps/\(path)")
  }
}

let iosCIScheme = Scheme(
  name: "CI-iOS",
  testAction:
  .testPlans(
    [
      "TestPlans/CI-iOS.xctestplan",
    ],
    attachDebugger: false
  )
)

let macCIScheme = Scheme(
  name: "CI-macOS",
  testAction:
  .testPlans(
    [
      "TestPlans/CI-macOS.xctestplan",
    ],
    attachDebugger: false
  )
)

let iOS = Scheme(
  name: "iOS",
  buildAction: .buildAction(
    targets: [
      .foundation("Core"),
      .foundation("UI"),
      .feature("Welcome"),
      .app("iOS"),
    ]
  ),
  runAction: .runAction(executable: .app("iOS"))
)

let workspace = Workspace(
  name: ProjectConfiguration.appName,
  projects: [
    "Apps/iOS",
  ],
  schemes: [
    macCIScheme,
    iosCIScheme,
    iOS,
  ],
  fileHeaderTemplate: "",
  additionalFiles: [
    .folderReference(path: .relativeToRoot("TestPlans")),
  ], generationOptions: .options(
    enableAutomaticXcodeSchemes: false,
    autogeneratedWorkspaceSchemes: .disabled,
    lastXcodeUpgradeCheck: .init(0, 1, 0),
    renderMarkdownReadme: true
  )
)
