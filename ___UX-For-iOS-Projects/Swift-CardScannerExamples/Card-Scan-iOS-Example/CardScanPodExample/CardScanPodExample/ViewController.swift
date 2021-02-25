import CardScan
import UIKit

class ViewController: UIViewController, SimpleScanDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func scanCardPress() {
        let vc = SimpleScanViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
        
    // MARK: -SimpleScanDelegate protocol implementation
    func userDidCancelSimple(_ scanViewController: SimpleScanViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func userDidScanCardSimple(_ scanViewController: SimpleScanViewController, creditCard: CreditCard) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "resultsViewController") as! ResultsViewController
        vc.card = creditCard

        var viewControllers = navigationController?.viewControllers.first.map { [$0] } ?? []
        viewControllers.append(vc)
        navigationController?.setViewControllers(viewControllers, animated: true)
    }
}
