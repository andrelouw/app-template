import Foundation

extension Bundle {
  /// The display name of the bundle
  public var displayName: String? {
    object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? object(forInfoDictionaryKey: "CFBundleName") as? String
  }
}
