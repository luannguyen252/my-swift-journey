import CardScan
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ScanViewController.configure(apiKey: "zLpCCN8xjLH120RwqdUNP20G3UGCFkme")
        return true
    }
}

