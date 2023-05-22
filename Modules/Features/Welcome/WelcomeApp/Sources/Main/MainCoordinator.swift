import Core
import UIKit
import Welcome

public final class MainCoordinator: Coordinator {
  private var navigationController: UINavigationController
  private var childCoordinators = [Coordinator]()

  public init(appWindow: UIWindow) {
    navigationController = UINavigationController()
    appWindow.rootViewController = navigationController
  }

  public func start() {
    let welcomeCoordinator = WelcomeCoordinator(
      appName: Bundle.main.displayName ?? "Example App",
      navigationController: navigationController
    )

    welcomeCoordinator.start()
    childCoordinators = [welcomeCoordinator]
  }
}
