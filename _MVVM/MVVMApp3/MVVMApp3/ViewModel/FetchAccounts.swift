//
//  FetchAccounts.swift
//  MVVMApp3
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

class FetchAccounts: ObservableObject {
    @Published var accounts: [Account] = []
    let url = "https://api.github.com/users/hadley/orgs"
    
    func fetchUsers() {
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: URL(string: url)!) { (data, _, _) in
            guard let users = data else {
                return
            }
            
            do {
                let decoder = try JSONDecoder().decode([Account].self, from: users)
            
                print(decoder)
                
                DispatchQueue.main.async {
                    self.accounts = decoder
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
