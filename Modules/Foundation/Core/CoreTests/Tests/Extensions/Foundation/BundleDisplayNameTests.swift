import Core
import XCTest

final class BundleDisplayNameTests: XCTestCase {
  func test_init() {
    XCTAssertEqual(Bundle.main.displayName, "xctest")
  }
}
