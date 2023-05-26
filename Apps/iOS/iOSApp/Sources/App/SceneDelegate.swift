import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var sceneCoordinator: SceneCoordinator?

  func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else {
      return
    }

    sceneCoordinator = SceneCoordinator(scene: windowScene)
    sceneCoordinator?.start()
  }
}
