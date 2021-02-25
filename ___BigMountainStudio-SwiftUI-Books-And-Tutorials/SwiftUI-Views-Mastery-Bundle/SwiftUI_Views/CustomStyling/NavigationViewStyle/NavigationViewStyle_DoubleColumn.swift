//  Copyright © 2019 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavigationViewStyle_DoubleColumn: View {
    var body: some View {
        NavigationView {
            // The first view is the Master
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                Text("Double Column Navigation View Style")
                    .font(.title).foregroundColor(.gray)
                Text("Using the double column, there is no need to navigate to a detail. You can add TWO views to the navigation view and it will automatically navigate to it.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.black)
                    .font(.title)
                Spacer()
            }
            .padding(.top, 25)
            .navigationTitle("Navigation View Style")
            .background(Color("Theme3BackgroundColor"))
            .ignoresSafeArea(edges: .bottom)
            
            // This is the Detail view on the right side
            ProfileDetail()
        }
        // Automatically navigate to the second view in the NavigationView
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct NavigationViewStyle_DoubleColumn_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewStyle_DoubleColumn()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
