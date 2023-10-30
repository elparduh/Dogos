import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let navigationController = UINavigationController()
    let catsViewController = DogsViewController()
    navigationController.viewControllers = [catsViewController]
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}
