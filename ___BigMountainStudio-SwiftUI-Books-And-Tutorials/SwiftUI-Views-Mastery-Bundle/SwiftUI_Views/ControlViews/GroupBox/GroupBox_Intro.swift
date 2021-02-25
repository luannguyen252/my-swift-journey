//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GroupBox_Intro: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("GroupBox",
                       subtitle: "Introduction",
                       desc: "You can use the GroupBox to combine views that are related.",
                       back: .blue, textColor: .white)
            
            GroupBox {
                Text("Login")
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct GroupBox_Intro_Previews: PreviewProvider {
    static var previews: some View {
        GroupBox_Intro()
    }
}
