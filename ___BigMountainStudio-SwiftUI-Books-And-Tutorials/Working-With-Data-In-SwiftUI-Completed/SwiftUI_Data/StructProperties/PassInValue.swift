//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct PassInValue: View {
    var name = "Mariana"
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State", subtitle: "Struct Variables", desc: "You can pass read-only values into a view.",
                       back: .blue, textColor: .white)
            
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
            
            DescView("The default name is \"Mariana\" but \"Mark\" is passed in and replaces it. It cannot be further updated once initially set.",
                     back: .blue, textColor: .white)
        }
        .font(.title)
    }
}

struct PassInValue_Previews: PreviewProvider {
    static var previews: some View {
        PassInValue(name: "Mark") // Passing in a new value
    }
}
