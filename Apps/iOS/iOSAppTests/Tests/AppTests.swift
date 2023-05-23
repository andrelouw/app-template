import iOS
import XCTest

final class AppTests: XCTestCase {
  func test_mainCoordinatorInit() {
    _ = MainCoordinator(appWindow: UIWindow())
  }
}
