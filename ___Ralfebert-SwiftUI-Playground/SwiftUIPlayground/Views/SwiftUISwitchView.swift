// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

enum Status {
    case loggedIn, loggedOut, expired
}

struct SwiftUISwitchView: View {

    @State var userStatus: Status = .loggedIn

    var body: some View {
        VStack {
            Text("switch for function builders was added in Xcode 12")

            switch self.userStatus {
            case .loggedIn:
                Text("Welcome!")
            case .loggedOut:
                Image(systemName: "person.fill")
            case .expired:
                Text("Session expired")
            }

        }
    }
}

struct SwitchUsageInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISwitchView()
    }
}
