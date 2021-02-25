//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Edges_KeyboardRegion_After: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Ignores Safe Area",
                       subtitle: "Regions",
                       desc: "The orange rectangle is now ignoring the keyboard region and will not be pushed up when the keyboard is shown",
                       back: .orange, textColor: .black)
            
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.orange)
                    .border(Color.red, width: 2)
                    .padding(.bottom)
                    .ignoresSafeArea(SafeAreaRegions.keyboard)
                
                TextField("Opens Keyboard", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
        }
        .font(.title)
    }
}

struct Edges_KeyboardRegion_After_Previews: PreviewProvider {
    static var previews: some View {
        Edges_KeyboardRegion_After()
    }
}
