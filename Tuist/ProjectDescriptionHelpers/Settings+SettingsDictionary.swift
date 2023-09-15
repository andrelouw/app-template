import ProjectDescription

extension Settings {
  public static func base(
    platformSet: PlatformSet
  ) -> Self {
    .settings(base: .base(platformSet: platformSet))
  }
}

extension SettingsDictionary {
  public static func base(
    platformSet: PlatformSet
  ) -> Self {
    .init()
    .supportedPlatforms(platformSet.supportedPlatforms)
    .deploymentTargets(platformSet.supportedPlatforms)
    .codeSigning(platformSet.supportedPlatforms)
    .sdkRoot(platform: platformSet.base)
  }

  private func supportedPlatforms(_ platforms: Set<Platform>) -> SettingsDictionary {
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

  func deploymentTargets(_ platforms: Set<Platform>) -> SettingsDictionary {
    var supportedPlatforms = [String: SettingValue]()

    if platforms.contains(.iOS) {
      supportedPlatforms["IPHONEOS_DEPLOYMENT_TARGET"] = SettingValue(stringLiteral: ProjectConfiguration.iOSVersion)
    }

    if platforms.contains(.macOS) {
      supportedPlatforms["MACOSX_DEPLOYMENT_TARGET"] = SettingValue(stringLiteral: ProjectConfiguration.macOSVersion)
    }

    return merging(supportedPlatforms)
  }

  func sdkRoot(platform: Platform) -> SettingsDictionary {
    var sdk = [String: SettingValue]()
    sdk["SDKROOT"] = "auto"

//    switch platform {
//    case .iOS:
//      sdk["SDKROOT"] = "iphoneos"
//    case .macOS:
//      sdk["SDKROOT"] = "macosx"
//    case .tvOS:
//      sdk["SDKROOT"] = "appletvos"
//    case .watchOS:
//      sdk["SDKROOT"] = "watchos"
//    @unknown default:
//      return self
//    }

    return merging(sdk)
  }

  func codeSigning(_ platforms: Set<Platform>) -> SettingsDictionary {
    var codeSigning = [String: SettingValue]()

    if platforms.contains(.macOS) {
      codeSigning["CODE_SIGN_IDENTITY[sdk=macosx*]"] = SettingValue("-")
    }

    return merging(codeSigning)
  }
}
