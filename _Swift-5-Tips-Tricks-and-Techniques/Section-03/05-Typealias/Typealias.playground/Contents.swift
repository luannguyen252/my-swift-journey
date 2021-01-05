import UIKit

typealias Duration = Double

let duration1: Duration = 180
let duration2: TimeInterval = 180

let totalDuration = duration1 + duration2
print(totalDuration)





typealias Point = (x: Double, y: Double)

let point = Point(1.5, 7.5)
print(point)








typealias RequestCompletionHandler<T: Decodable> = (_ value: T?, _ error: Error?) -> Void


func requestFromNetwork<T: Decodable>(completionHandler: RequestCompletionHandler<T>) {
    //do some networking
    
    let data = "Invalid JSON".data(using: .utf8)!
    do {
        let value = try JSONDecoder().decode(T.self, from: data)
        completionHandler(value, nil)
    } catch {
        completionHandler(nil, error)
    }
}


requestFromNetwork { (string: String?, error) in
    if let string = string {
        print("Success: \(string)")
    } else if let error = error {
        print("Error: \(error)")
    }
}
