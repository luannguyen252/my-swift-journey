//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Navigation_BackgroundColor: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                    .ignoresSafeArea() // Allows background color to go BEHIND large nav bar.
                
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    HeaderView("NavigationView", subtitle: "Background Color", desc: "With the larger navigation bar, you can have a background color extend underneath it.",
                               back: Color("Theme3ForegroundColor"),
                               textColor: Color("Theme3BackgroundColor"))
                    
                    Spacer()
                }
                .font(.title)
                .padding(.top, 25)
            }
            .navigationTitle("Navigation Views")
        }
    }
}

struct Navigation_IgnoringSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_BackgroundColor()
    }
}
