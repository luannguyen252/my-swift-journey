import UIKit
import MaterialDesignSymbol

class ViewController: UIViewController {
    @IBOutlet var sampleImageView: UIImageView!
    @IBOutlet var sampleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // UIImage
        self.sampleImageView.image = MaterialDesignSymbol(icon: .viewHeadline48px, size: 30).image()

        // String
        sampleLabel.font = MaterialDesignFont.fontOfSize(20)
        sampleLabel.text = MaterialDesignIconEnum.clear48px.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
