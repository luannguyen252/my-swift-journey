import UIKit

func returnTwoInts() -> (Int, Int) {
    return (5, 8)
}

print(returnTwoInts())
print(returnTwoInts().0)


func getCoordinates() -> (x: Double, y: Double) {
    return (0.5, 7.1)
}

print(getCoordinates())
print(getCoordinates().y)




func doSomeNetworkStuff(completionHandler: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async {
        completionHandler()
    }
}

doSomeNetworkStuff {
    print("Called from completionHandler in background")
}




let names = ["Arthur", "John", "Rick", "Bob", "Adam", "Robert"]

let nameWithR = names.first { (name) -> Bool in
    return name.contains("r")
}

print(nameWithR)
