import Core
import UIKit

public final class WelcomeCoordinator: Coordinator {
  // TODO: Needs to be a View Controller instead where this coordinator just embeds its view controller
  private let navigationController: UINavigationController
  private let appName: String

  public init(
    appName: String,
    navigationController: UINavigationController
  ) {
    self.appName = appName
    self.navigationController = navigationController
  }

  public func start() {
    let mainViewController = WelcomeViewController(appName: appName)
    navigationController.viewControllers = [mainViewController]
  }
}
