import UIKit
import UBottomSheet

class LabelViewController: UIViewController, Draggable {
    var sheetCoordinator: UBottomSheetCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sheetCoordinator?.startTracking(item: self)

        let add = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addAction))
        self.navigationItem.rightBarButtonItem = add
        
    }
    
    @IBAction func dismissAction() {
        sheetCoordinator?.removeSheetChild(item: self)
    }
    
    @objc func addAction(_ sender: Any) {
        let vc = LabelViewController()
        vc.sheetCoordinator = sheetCoordinator
        if sheetCoordinator?.usesNavigationController ?? false{
            navigationController?.pushViewController(vc, animated: true)
        }else{
            sheetCoordinator?.addSheetChild(vc)
        }
    }
}
