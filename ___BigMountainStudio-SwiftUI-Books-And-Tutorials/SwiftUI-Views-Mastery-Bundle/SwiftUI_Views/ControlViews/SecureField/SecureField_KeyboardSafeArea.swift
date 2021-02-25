//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct SecureField_KeyboardSafeArea: View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image("Logo")
            Spacer()
            
            HeaderView("SecureField",
                       subtitle: "Keyboard Safe Area",
                       desc: "SecureFields will automatically move into view when the keyboard appears. The keyboard adjusts the bottom safe area so it will not cover views.",
                       back: .purple, textColor: .white)
            
            TextField("user name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct SecureField_KeyboardSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        SecureField_KeyboardSafeArea()
    }
}
