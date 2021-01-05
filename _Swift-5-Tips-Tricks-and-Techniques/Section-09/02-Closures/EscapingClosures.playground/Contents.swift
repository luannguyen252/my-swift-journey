import UIKit

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
        handler.closureCalledBeforeReturn {
            returnString = $0
        }
        
        handler.closureCalledAfterReturn { [weak self] (string) in
            self?.returnString = string
        }
    }
}

URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
