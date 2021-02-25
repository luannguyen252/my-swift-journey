//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct AppStorage_Persistence: View {
    @AppStorage("darkBackground") var darkBackground = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("@AppStorage",
                       subtitle: "Persistence",
                       desc: "Data you store using @AppStorage will persist even after the app closes.")
            
            Toggle(isOn: $darkBackground, label: {
                Text("Use Dark Background?")
            })
            .padding()
        }
        .font(.title)
        .preferredColorScheme(darkBackground ? .dark : .light)
    }
}

struct AppStorage_Persistence_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_Persistence()
    }
}
