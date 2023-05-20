import ProjectDescription

extension Settings {
  public static func base(for platforms: [Platform]) -> Self {
    .settings(base: .base(for: platforms))
  }
}

extension SettingsDictionary {
  public static func base(for platforms: [Platform]) -> Self {
    .init()
    .supportedPlatforms(platforms)
  }

  private func supportedPlatforms(_ platforms: [Platform]) -> SettingsDictionary {
    var supportedPlatforms = [String]()

    if platforms.contains(.iOS) {
      supportedPlatforms.append(contentsOf: ["iphoneos", "iphonesimulator"])
    }

    if platforms.contains(.macOS) {
      supportedPlatforms.append("macosx")
    }

    if platforms.contains(.tvOS) {
      supportedPlatforms.append(contentsOf: ["appletvos", "appletvsimulator"])
    }

    return merging(["SUPPORTED_PLATFORMS": SettingValue(stringLiteral: supportedPlatforms.joined(separator: " "))])
  }
}
