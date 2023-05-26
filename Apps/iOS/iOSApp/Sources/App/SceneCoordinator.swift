import Core
import UIKit

final class SceneCoordinator: Coordinator {
  private let window: UIWindow
  private var childCoordinators = [Coordinator]()

  init(scene: UIWindowScene) {
    window = UIWindow(windowScene: scene)
  }

  func start() {
    let mainCoordinator = MainCoordinator(appWindow: window)
    mainCoordinator.start()
    childCoordinators = [mainCoordinator]
    window.makeKeyAndVisible()
  }
}
