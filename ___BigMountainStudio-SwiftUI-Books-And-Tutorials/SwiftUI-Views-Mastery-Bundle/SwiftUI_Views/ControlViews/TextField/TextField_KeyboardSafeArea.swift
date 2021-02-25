//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TextField_KeyboardSafeArea: View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image("Logo")
            Spacer()
            
            HeaderView("TextField",
                       subtitle: "Keyboard Safe Area",
                       desc: "TextFields will automatically move into view when the keyboard appears. The keyboard adjusts the safe area so it will not cover views.",
                       back: .orange)
            
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

struct TextField_KeyboardSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        TextField_KeyboardSafeArea()
    }
}
