import ProjectDescription

extension Platform {
  public static var `default`: Platform {
    .iOS
  }
}

extension Array where Element == Platform {
  public var primary: Platform {
    first ?? .default
  }
}
