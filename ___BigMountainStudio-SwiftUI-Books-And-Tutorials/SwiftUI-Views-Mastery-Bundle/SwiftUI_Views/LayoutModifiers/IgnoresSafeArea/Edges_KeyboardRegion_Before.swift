//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Edges_KeyboardRegion_Before: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Ignores Safe Area",
                       subtitle: "Regions",
                       desc: "The Safe Area will get smaller when a keyboard is shown. This will push up all of your views",
                       back: .orange, textColor: .black)
            
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.orange)
                    .border(Color.red, width: 2)
                    .padding(.bottom)
                TextField("Opens Keyboard", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
        }
        .font(.title)
    }
}

struct Edges_KeyboardRegion_Before_Previews: PreviewProvider {
    static var previews: some View {
        Edges_KeyboardRegion_Before()
    }
}
