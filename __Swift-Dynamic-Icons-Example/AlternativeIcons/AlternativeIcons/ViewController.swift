import UIKit

class ViewController: UIViewController {
    // Properties
    var appIconManager = IconManager()
    
    // IB-Properties
    @IBOutlet weak var defaultIcon: UIButton!
    @IBOutlet weak var charmanderIcon: UIButton!
    @IBOutlet weak var pikachuIcon: UIButton!
    
    @IBAction func defaultIconTapped(_ sender: Any) {
        // Set the icons to default
        UIApplication.shared.setAlternateIconName(nil)
    }
    
    @IBAction func charmanderTapped(_ sender: Any) {
        appIconManager.changeAppIcon(to: .charmanderIcon)
    }
    
    @IBAction func pikachuTapped(_ sender: Any) {
        appIconManager.changeAppIcon(to: .pikachuIcon)
    }

    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // Privates
    func configureUI() {
        let icons = [charmanderIcon, pikachuIcon, defaultIcon]
        
        for each in icons{
            each?.layer.borderColor = UIColor.black.cgColor
            each?.layer.borderWidth = 2
        }
    }
}
