import SwiftUI

struct ServiceLabel     : View {
    @Environment(\.colorScheme) var colorScheme
    var namespace       : Namespace.ID
    let name            : String
    let description     : String
    
    var body: some View {
        HStack {
            ServiceIcon(namespace: namespace, name: name, size: 26)
            Text(description)
                .font(.custom("TTFirsNeue-DemiBold", size: 14))
                .foregroundColor(Color(colorScheme == .dark ? "light" : "dark"))
        }
    }
}
