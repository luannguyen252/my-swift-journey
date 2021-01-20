import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gifImageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView.loadGif(name: "Netflix")
        // Do any additional setup after loading the view.
    }
}
