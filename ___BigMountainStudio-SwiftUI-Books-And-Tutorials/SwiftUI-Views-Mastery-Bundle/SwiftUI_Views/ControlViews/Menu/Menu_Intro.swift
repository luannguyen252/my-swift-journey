//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Menu_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Menu",
                       subtitle: "Introduction",
                       desc: "Use the Menu view to group up similar actions to present to the user from a tappable button.",
                       back: .blue, textColor: .white)
            Spacer()
            
            Menu("Edit") {
                Button(action: {}) {
                    Text("Add color")
                    Image(systemName: "eyedropper.full")
                }
                Button(action: {}) {
                    Image(systemName: "circle.lefthalf.fill")
                        .foregroundColor(.blue) // No effect
                    Text("Change contrast")
                }
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct Menu_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Menu_Intro()
    }
}
