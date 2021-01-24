import UIKit

protocol MoreTableViewCellDelegate {
    func moreTableViewCellDidTappedButton(sender: UIButton)
}

class MoreTableViewCell: UITableViewCell {
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var delegate : MoreTableViewCellDelegate?

    @IBAction func buttonTapped(_ sender: UIButton) {
        if delegate != nil {
            delegate?.moreTableViewCellDidTappedButton(sender: sender)
        }
    }
}
