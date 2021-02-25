//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct EnvironmentObject_GloballyAccessible: View {
    @EnvironmentObject var user: UserModel
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("@EnvironmentObject",
                       subtitle: "Globally Accessible",
                       desc: "To make an ObservableObject globally accessible to your app, add it to the root view in your App object.", back: .purple, textColor: .white)
            Form {
                Section(header: Text("Settings")) {
                HStack {
                    Text("Username: ")
                    TextField("username", text: $user.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Toggle("Show as online", isOn: $user.showAsOnline)
                }
            }
        }.font(.title)
    }
}

struct EnvironmentObject_GloballyAccessible_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObject_GloballyAccessible()
            .environmentObject(UserModel())
    }
}
