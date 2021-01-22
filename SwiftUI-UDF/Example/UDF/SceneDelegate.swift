import UIKit
import SwiftUI
import SwiftUI_UDF

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let store = AppStore(initial: AppState()) { state, action in
        print("Reduce\t\t\t", action)
        state.reduce(action)
        print("State: \t", state)
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        store.subscribe(observer: LoginMiddleware(store: store).asObserver)
        store.subscribe(observer: ItemsMiddleware(store: store).asObserver)
                
        store.dispatch(action: AnyAction.UpdateEmail(email: "test"))
        store.dispatch(action: AnyAction.UpdatePassword(password: "pass"))
                        
        let contentView = RootContainer().environmentObject(EnvironmentStore(store: store))

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
