import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)

        let teamsStore = TeamsStore()
        window.rootViewController = UIHostingController(rootView: MainView().environmentObject(teamsStore))
        self.window = window
        window.makeKeyAndVisible()
    }
}
