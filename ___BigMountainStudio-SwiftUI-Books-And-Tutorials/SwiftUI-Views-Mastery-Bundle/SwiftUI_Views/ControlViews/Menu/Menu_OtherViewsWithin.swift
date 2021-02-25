//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Menu_OtherViewsWithin: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Menu {
                    Button("Menu Item 1", action: {})
                    Divider()
                    Button(action: {}) {
                        Text("Dividers create a thicker separator")
                        Image(systemName: "hand.point.up")
                    }
                    Divider()
                    Text("This is a text view")
                        .font(.caption) // No effect
                        .textCase(.uppercase)
                    Button(action: {}) {
                        Text("Menu text will use up to two lines if too long.")
                        Image(systemName: "paperplane")
                    }
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .padding(.leading, 20)
                }
                Spacer()
            }
            
            Spacer()
            
            HeaderView("Menu",
                       subtitle: "Other Views Within",
                       desc: "You can include other views, not just buttons, inside the menu.",
                       back: .blue, textColor: .white)
            Spacer()
            
        }
        .font(.title)
    }
}

struct Menu_OtherViewsWithin_Previews: PreviewProvider {
    static var previews: some View {
        Menu_OtherViewsWithin()
    }
}
