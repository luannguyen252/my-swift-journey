//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class UserModel: ObservableObject {
    @Published var username = "Ellen"
    @Published var showAsOnline = true
}

@main
struct SwiftUIDataApp: App {
    var body: some Scene {
        WindowGroup {
            Environment_NotAvailableInInit()
//                .environmentObject(UserModel())
                .environmentObject(UserViewModel())
        }
    }
}
