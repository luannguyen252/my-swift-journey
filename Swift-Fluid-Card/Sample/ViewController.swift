import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cardView: FluidCardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let topNib = UINib(nibName: "TopView", bundle: nil)
        let topView = topNib.instantiate(withOwner: self, options: nil).first as! UIView
        let bottomNib = UINib(nibName: "BottomView", bundle: nil)
        let bottomView = bottomNib.instantiate(withOwner: self, options: nil).first as! UIView
        cardView.topContentView = topView
        cardView.bottomContentView = bottomView
    }
}
