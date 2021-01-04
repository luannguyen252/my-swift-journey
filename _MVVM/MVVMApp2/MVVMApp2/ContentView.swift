//
//  ContentView.swift
//  MVVMApp2
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

// AppDataService
protocol DataService {
    func getUsers(completion: @escaping ([User]) -> Void)
}

class AppDataService: DataService {
    func getUsers(completion: @escaping ([User]) -> Void) {
        DispatchQueue.main.async {
            completion([
                User(id: 1, name: "Luan Nguyen"),
                User(id: 2, name: "Steve Jobs"),
                User(id: 3, name: "Craig Federighi")
            ])
        }
    }
}

// Model
struct User: Identifiable {
    let id: Int
    let name: String
}

// View
struct ContentView: View {
    @StateObject var viewModel: ViewModel
        
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear(perform: viewModel.getUsers)
    }
}

// ViewModel
extension ContentView {
    class ViewModel: ObservableObject {
        @Published var users = [User]()
        
        let dataService: DataService
        
        init(dataService: DataService = AppDataService()) {
            self.dataService = dataService
        }
        
        func configure(with something: Any) {  }
        
        func getUsers() {
            dataService.getUsers { [weak self] users in
                self?.users = users
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 0, name: "Dummy")
        let viewModel = ContentView.ViewModel()
        viewModel.users = [user]
        
        return ContentView(viewModel: viewModel)
    }
}
#endif
