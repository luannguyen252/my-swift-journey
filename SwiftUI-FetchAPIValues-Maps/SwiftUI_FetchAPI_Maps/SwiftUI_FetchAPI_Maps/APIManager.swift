

import SwiftUI
import Combine

class APIManager: ObservableObject {
    var didChange = PassthroughSubject<Void,Never>()
    @Published var users = [User]() {
        didSet {
            didChange.send(())
        }
    }
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let user = try! JSONDecoder().decode([User].self, from: data)
            DispatchQueue.main.async {
                self.users = user
            }
            print("API values fetched Successfully")
            }.resume()
    }
    
}
