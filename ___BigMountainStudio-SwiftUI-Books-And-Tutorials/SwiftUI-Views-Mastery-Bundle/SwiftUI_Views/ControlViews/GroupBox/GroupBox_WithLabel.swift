//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GroupBox_WithLabel: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GroupBox",
                       subtitle: "With Label",
                       desc: "Instead of using your own text label, the GroupBox has one built in.",
                       back: .blue, textColor: .white)
            
            GroupBox(label: Text("Login (Default text format)")) {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            DescView(desc: "You can override the default label formatting.",
                     back: .blue, textColor: .white)
            
            GroupBox(label: Text("Reset Password")
                        .font(.title2)
                        .fontWeight(.light)) {
                SecureField("Password", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct GroupBox_WithLabel_Previews: PreviewProvider {
    static var previews: some View {
        GroupBox_WithLabel()
    }
}
