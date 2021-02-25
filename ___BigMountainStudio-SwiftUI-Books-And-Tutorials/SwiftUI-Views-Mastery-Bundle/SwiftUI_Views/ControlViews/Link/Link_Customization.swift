//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Link_Customization: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("Link",
                       subtitle: "Customizations",
                       desc: "Like the Button, there's another initializer you can use create a custom button for the Link.")
            
            Link(destination: URL(string: "https://www.apple.com")!, label: {
                HStack(spacing: 20.0) {
                    Image(systemName: "applelogo")
                    Text("Go to Apple")
                }
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Capsule()
                                .fill(Color.blue)
                                .shadow(radius: 8, y: 18))
            })
            
            Spacer()
        }
        .font(.title)
    }
}

struct Link_Customization_Previews: PreviewProvider {
    static var previews: some View {
        Link_Customization()
    }
}
