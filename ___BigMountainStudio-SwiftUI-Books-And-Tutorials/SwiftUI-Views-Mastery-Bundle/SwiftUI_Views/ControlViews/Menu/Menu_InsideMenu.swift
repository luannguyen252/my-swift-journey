//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Menu_InsideMenu: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Menu",
                       subtitle: "Inner Menu",
                       desc: "You can also have a Menu inside of a Menu.",
                       back: .blue, textColor: .white)
            
            Spacer()
            
            Menu("Edit") {
                Button(action: {}) {
                    Text("Add color")
                    Image(systemName: "eyedropper.full")
                }
                Button(action: {}) {
                    Image(systemName: "circle.lefthalf.fill")
                    Text("Change contrast")
                }
                Menu("More...") {
                    Button(action: {}) {
                        Text("Magic Wand")
                        Image(systemName: "wand.and.stars")
                    }
                    Button(action: {}) {
                        Image(systemName: "paintbrush.fill")
                        Text("Magic Paint")
                    }
                }
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct Menu_InsideMenu_Previews: PreviewProvider {
    static var previews: some View {
        Menu_InsideMenu()
    }
}
