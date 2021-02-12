import UIKit
import AppIcons

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentAppIcons()
    }
    
    @IBAction func presentAppIcons() {
        let iconConfig = AppIcons.Configuration(cornerRadius: 5.0, primaryIconName: "Default")
        let iconsViewController = AppIcons.viewController(configuration: iconConfig)
        present(iconsViewController, animated: true, completion: nil)
    }
}
