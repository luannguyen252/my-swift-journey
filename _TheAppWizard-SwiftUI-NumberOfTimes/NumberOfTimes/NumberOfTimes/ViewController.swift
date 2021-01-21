import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelMessage: UILabel!
    var num = 0;

    @IBAction func buttonClick(_ sender: Any) {
        num += 1;
        labelMessage.text = "\(num)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
