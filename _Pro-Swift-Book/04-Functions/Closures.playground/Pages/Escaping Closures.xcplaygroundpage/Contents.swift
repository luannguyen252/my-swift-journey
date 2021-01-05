import UIKit

typealias Closure = (() -> Void)

var queuedClosures: [Closure] = []


// 🔑 This fails because the `closure` isn't executed before the function returns
//func addClosureToQueue(_ closure: Closure) {
//    queuedClosures.append(closure)
//}

func addClosureToQueue(_ closure: @escaping Closure) {
    queuedClosures.append(closure)
}


addClosureToQueue({ print("Running closure 1") })
addClosureToQueue({ print("Running closure 2") })
addClosureToQueue({ print("Running closure 3") })



func executeQueuedClosures() {
    queuedClosures.forEach { $0() }
}


executeQueuedClosures()
