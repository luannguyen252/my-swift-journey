//  Copyright © 2019 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavigationViewStyle_Stack: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                Text("Stack Navigation View Style").font(.title).foregroundColor(.gray)
                Text("The stack navigation view style will force the nav bar to always extend to fill the screen, no matter the device or orientation.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal, 20) // More horizontal padding for the notch
                    .background(Color.orange)
                    .foregroundColor(Color.black)
                    .font(.title)
                
                NavigationLink(destination: ProfileDetail()) {
                    Text("Navigate to Detail")
                }.font(.title)
                Spacer()
            }
            .padding(.top, 25)
            .navigationTitle("Navigation View Style")
            .background(Color("Theme3BackgroundColor"))
            // Ignore more areas to extend into sides
            .ignoresSafeArea(edges: [.bottom, .horizontal])
        }
        // Extend the nav bar so it is full width, no matter
        // the device or orientation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NavigationViewStyle_Stack_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewStyle_Stack()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
