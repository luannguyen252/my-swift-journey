//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct AppStorage_Intro: View {
    @AppStorage("username") var username = "Mark"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "Introduction",
                           desc: "You can use @AppStorage to store small amounts of data for your app.")
                
                Text("AppStorage: username")
                Text("\(username)").bold()
                
                NavigationLink("Edit", destination: AppStorage_Edit())
            }
            .font(.title)
            .navigationTitle("App Storage")
        }
    }
}

struct AppStorage_Edit: View {
    @AppStorage("username") var username: String!
    @State private var newUsername = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("",
                       subtitle: "Update AppStorage",
                       desc: "To update AppStorage, just assign a new value to the variable.")
            
            Text("Enter a new user name:")
            TextField("new user name", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Update") {
                username = newUsername
            }
        }
        .font(.title)
        .navigationTitle("Update App Storage")
    }
}

struct AppStorage_Intro_Previews: PreviewProvider {
    @AppStorage("username") static var username: String!
    
    static var previews: some View {
        username = "really_really_really_really_long_username"
        
        return Group {
            AppStorage_Intro()
            AppStorage_Edit()
        }
    }
}
