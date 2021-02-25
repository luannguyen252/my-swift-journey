//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct BindingToState: View {
    @State var name = "Mariana"
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State", subtitle: "Struct Variables", desc: "Add @State before the variable to make it mutable.", back: .blue, textColor: .white)
            
            Button(action: {
                self.name = "Mark" // self.name is now mutable
            }) {
                Text("Change Name to 'Mark'")
                    .padding()
                    .background(Capsule().stroke(Color.blue, lineWidth: 2))
            }
            Spacer()
            
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
        }
        .font(.title)
    }
}

struct BindingToState_Previews: PreviewProvider {
    static var previews: some View {
        BindingToState(name: "Joe")
    }
}
