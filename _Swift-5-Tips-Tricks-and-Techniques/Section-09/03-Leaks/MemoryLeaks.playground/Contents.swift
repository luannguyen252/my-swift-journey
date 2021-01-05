import UIKit

class ViewController {
    
    var model: Model?
    
    deinit {
        print("ViewController deinitialized")
    }
}

class Model {
    
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    deinit {
        print("Model deinitialized")
    }
}

var vc: ViewController? = ViewController()
vc?.model = Model(viewController: vc!)
vc = nil

print("Both classes should have been deinitialized at this point.")
