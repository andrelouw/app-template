import SwiftUI
import UI
import XCTest

final class ColorFontTests: XCTestCase {
  func test_fontPrimary_matchesAssetsFontPrimary() {
    XCTAssertEqual(Color.font.primary, UIAsset.fontPrimary.swiftUIColor)
  }

  func test_fontSecondary_matchesAssetsFontSecondary() {
    XCTAssertEqual(Color.brand.secondary, UIAsset.brandSecondary.swiftUIColor)
  }
}
