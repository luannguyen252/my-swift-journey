//
//  ContentView.swift
//  CoreDataJSON
//
//  Created by Master Family on 17/09/2020.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)]) var users: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            
            List(users, id: \.self) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    Text(user.wrappedName)
                }
            }.navigationTitle(Text("Users"))
            
            
        }.onAppear(perform: loadData)
        
    }
    
    func loadData() {
        
        if (users.isEmpty) {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            
            let semaphore = DispatchSemaphore(value: 0)
            
            var request = URLRequest(url: url, timeoutInterval: Double.infinity)
            request.addValue("__cfduid=d416fe7dc0a110c286ef2b4a5f44efea41601353257", forHTTPHeaderField: "Cookie")
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    fatalError("Network error: " + error.localizedDescription)
                }
                
                guard (response as? HTTPURLResponse) != nil else {
                    fatalError("Not a HTTP response")
                }
                
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                print(String(data: data, encoding: .utf8)!)
                semaphore.signal()
                
                let decoder = JSONDecoder()
                decoder.userInfo[CodingUserInfoKey.context!] = self.moc
                decoder.dateDecodingStrategy = .iso8601
                
                _ = try? decoder.decode([User].self, from: data)
                
            }
            .resume()
            semaphore.wait()
        }
        
    }
    
    func deleteAllData() {
        for user in users {
            moc.delete(user)
        }

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

