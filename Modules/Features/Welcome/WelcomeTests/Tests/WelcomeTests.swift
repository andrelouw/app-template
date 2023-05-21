import Welcome
import XCTest

final class WelcomeTests: XCTestCase {
  func test_init() {
    _ = WelcomeCoordinator(
      appName: "WelcomeApp",
      navigationController: UINavigationController()
    )
  }
}
