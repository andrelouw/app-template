import Core
import UIKit

final class MainCoordinator: Coordinator {
  private var navigationController: UINavigationController

  init(appWindow: UIWindow) {
    navigationController = UINavigationController()
    appWindow.rootViewController = navigationController
  }

  func start() {
    let mainViewController = MainViewController()
    navigationController.viewControllers = [mainViewController]
  }
}
