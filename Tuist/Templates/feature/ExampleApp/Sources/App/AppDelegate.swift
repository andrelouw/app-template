import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  var appCoordinator: AppCoordinator?

  func application(
    _: UIApplication,
    didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    appCoordinator = AppCoordinator(window: window)
    appCoordinator?.start()

    return true
  }
}
