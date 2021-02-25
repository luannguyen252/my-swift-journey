//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Animate_InsideIfInZStack: View {
    @State private var showMessage = false
    
    var body: some View {
        ZStack {
            // Remove this background color and it works as expected
            Color.red.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Button(action: {
                    self.showMessage.toggle()
                }) {
                    Text("SHOW MESSAGE")
                }
            }
            
            Text("HELLO WORLD!")
                .opacity(showMessage ? 1 : 0)
                .animation(.easeOut(duration: 2))
        }
    }
}

struct Animate_InsideIfInZStack_Previews: PreviewProvider {
    static var previews: some View {
        Animate_InsideIfInZStack()
    }
}
