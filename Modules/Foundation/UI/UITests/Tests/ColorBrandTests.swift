import SwiftUI
import UI
import XCTest

final class ColorBrandTests: XCTestCase {
  func test_brandPrimary_matchesAssetsBrandPrimary() {
    XCTAssertEqual(Color.brand.primary, UIAsset.brandPrimary.swiftUIColor)
  }

  func test_brandSecondary_matchesAssetsBrandSecondary() {
    XCTAssertEqual(Color.brand.secondary, UIAsset.brandSecondary.swiftUIColor)
  }

  func test_brandTertiary_matchesAssetsBrandTertiary() {
    XCTAssertEqual(Color.brand.tertiary, UIAsset.brandTertiary.swiftUIColor)
  }
}
