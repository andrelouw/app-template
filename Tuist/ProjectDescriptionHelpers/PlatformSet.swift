import ProjectDescription

// MARK: - PlatformSet

public struct PlatformSet {
  public let base: Platform
  public let supportedPlatforms: Set<Platform>

  private init(base: Platform, supportedPlatforms: Set<Platform>) {
    self.base = base
    self.supportedPlatforms = supportedPlatforms
  }

  fileprivate init(platform: Platform) {
    self.init(base: platform, supportedPlatforms: [platform])
  }

  fileprivate init(platforms: [Platform]) {
    self.init(base: platforms[0], supportedPlatforms: Set(platforms))
  }

  public static let iOS = PlatformSet(platform: .iOS)
  public static let macOS = PlatformSet(platform: .macOS)
  public static let tvOS = PlatformSet(platform: .tvOS)
  public static let watchOS = PlatformSet(platform: .watchOS)

  public func with(supportedPlatforms: Platform...) -> PlatformSet {
    PlatformSet(
      base: base,
      supportedPlatforms: Set(self.supportedPlatforms).union(supportedPlatforms)
    )
  }
}

extension Platform {
  public func asPlatformSet() -> PlatformSet {
    PlatformSet(platform: self)
  }
}

extension [Platform] {
  public func asPlatformSet() -> PlatformSet {
    PlatformSet(platforms: self)
  }
}
