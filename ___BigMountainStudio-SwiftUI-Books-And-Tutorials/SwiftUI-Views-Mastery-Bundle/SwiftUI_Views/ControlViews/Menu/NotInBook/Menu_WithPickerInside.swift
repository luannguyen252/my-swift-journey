//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio
// Currently a bug where the menu label isn't restoring untapped state after Menu closes because of the string interpolation. FB: FB8876012
import SwiftUI

struct Menu_WithPickerInside: View {
    @State private var youTuberName = "Mark"
    
    var body: some View {
        VStack(spacing: 20) {
            Menu {
                Picker(selection: $youTuberName, label: Text("")) {
                    Text("Paul").tag("Paul")
                    Text("Chris").tag("Chris")
                    Text("Mark").tag("Mark")
                    Text("Stewart").tag("Stewart")
                    Text("Meng").tag("Meng")
                }
            } label: {
                Label(
                    title: { Text("Watching: \(youTuberName)") },
                    icon: { Image(systemName: "person.crop.circle.fill") })
            }
            
            Spacer()
            
            HeaderView("Menu",
                       subtitle: "Picker Inside",
                       desc: "Stewart Lynch showed me that Menus can remember you selection by using a Picker within.",
                       back: .blue, textColor: .white)
            Spacer()
            
        }
        .font(.title)
    }
}

struct Menu_WithPickerInside_Previews: PreviewProvider {
    static var previews: some View {
        Menu_WithPickerInside()
    }
}
