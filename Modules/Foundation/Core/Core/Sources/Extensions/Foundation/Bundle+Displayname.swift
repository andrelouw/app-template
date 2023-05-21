import Foundation

public extension Bundle {
  /// The display name of the bundle
  var displayName: String? {
    return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? object(forInfoDictionaryKey: "CFBundleName") as? String
  }
}
