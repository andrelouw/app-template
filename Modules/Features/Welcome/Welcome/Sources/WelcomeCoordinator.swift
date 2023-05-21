import Core
import UIKit

public final class WelcomeCoordinator: Coordinator {
  // TODO: Needs to be a View Controller instead where this coordinator just embeds its view controller
  private var navigationController: UINavigationController

  public init(
    navigationController: UINavigationController
  ) {
    self.navigationController = navigationController
  }

  public func start() {
    let mainViewController = WelcomeViewController(appName: Bundle.main.displayName ?? "App")
    navigationController.viewControllers = [mainViewController]
  }
}

// MARK: - Private extensions -

// MARK: - Bundle
private extension Bundle {
  // Name of the app
  var displayName: String? {
    return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? object(forInfoDictionaryKey: "CFBundleName") as? String
  }
}
