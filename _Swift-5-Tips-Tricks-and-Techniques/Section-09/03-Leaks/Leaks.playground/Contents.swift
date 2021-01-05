import UIKit

class ViewController {
    var model: Model?
    
    deinit {
        print("ViewController deinit")
    }
}

class Model {
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    deinit {
        print("Model deinit")
    }
}

var vc: ViewController? = ViewController()
vc?.model = Model(viewController: vc!)
vc = nil
print("At this point, both classes should be deallocated")
