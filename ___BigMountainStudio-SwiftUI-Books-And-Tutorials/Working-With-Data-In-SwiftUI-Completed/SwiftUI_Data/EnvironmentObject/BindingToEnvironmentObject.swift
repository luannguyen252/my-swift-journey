//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class AppVariables: ObservableObject {
    @Published var personLoggedIn: String = "Mark"
}

struct BindingToEnvironmentObject: View {
    @EnvironmentObject var appVariables: AppVariables
    
    var body: some View {
        VStack(spacing: 20.0) {
//            HeaderView
            Text("One-Way Binding:")
            Text("Hello, \(appVariables.personLoggedIn)")
                .bold()
            Divider()
            Text("Two-Way Binding:")
            TextField("Person logged in", text: $appVariables.personLoggedIn)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
    }
}

struct BindingToEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        BindingToEnvironmentObject()
            .environmentObject(AppVariables())
    }
}
