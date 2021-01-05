import UIKit

// 1. escaping closures

class Handler {
    
    var closure: ((String) -> Void)?
    
    func closureCalledBeforeReturn(closure: (String) -> Void) {
        closure("")
    }
    
    func closureCalledAfterReturn(closure: @escaping (String) -> Void) {
        self.closure = closure
        // called at some later point
    }
}

class Foo {
    var returnString = ""
    let handler = Handler()
    
    func callClosures() {
        handler.closureCalledAfterReturn { [weak self] in
            self?.returnString = $0 // potential memory leak
        }
        
        handler.closureCalledBeforeReturn {
            returnString = $0
        }
    }
}

// Real life example
URLSession.shared.dataTask(with: URL(string: "https://swapi.co")!) { (data, response, error) in
    
}
