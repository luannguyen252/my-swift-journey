//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct User: Codable {
    var name = ""
    var age = 0
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    
    static func decode(userData: Data) -> User? {
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: userData) {
            return user
        } else {
            return nil
        }
    }
}

struct AppStorage_StoreStruct: View {
    @AppStorage("user") var userData = User(name: "Joe Duran", age: 26).encode()!
    @State private var userName = ""
    @State private var age = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("AppStorage",
                       subtitle: "Store Structs",
                       desc: "Since you can store Data, you can store a whole struct in AppStorage.")
            
            Text("AppStorage")
            Text("Name: \(userName)").bold()
            Text("Age: \(age)").bold()
        }
        .font(.title)
        .onAppear {
            // We need to convert the Data to primitive types
            getAppStorageData()
        }
    }
    
    func getAppStorageData() {
        if let appUser = User.decode(userData: userData) {
            userName = appUser.name
            age = appUser.age
        }
    }
}

struct AppStorage_StoreStruct_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_StoreStruct()
    }
}
