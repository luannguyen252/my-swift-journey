//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct StructVariables: View {
    var name = "Mariana"
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State", subtitle: "Struct Variables", desc: "Variables in structs are immutable. Mutable means a variable can change. Immutable means a variable can NOT change.",
                       back: .blue, textColor: .white)
            
            Button(action: {
//                self.name = "Mark" // Error: Cannot assign to property: 'self' is immutable
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
            
            DescView("The name variable is read-only and cannot be updated.", back: .blue, textColor: .white)
        }
        .font(.title)
    }
}

struct StructVariables_Previews: PreviewProvider {
    static var previews: some View {
        StructVariables()
    }
}
