import CardScan
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var cardBorderView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var expiryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var card: CreditCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardBorderView.layer.borderWidth = 1
        cardBorderView.layer.borderColor = UIColor.black.cgColor
        cardBorderView.layer.cornerRadius = 10
        
        guard let card = card else { preconditionFailure("must set card for results") }
        
        numberLabel.text = CreditCardUtils.format(number: card.number)
        expiryLabel.text = card.expiryForDisplay()
        nameLabel.text = card.name
    }
}
