//
//  ContentView.swift
//  SwiftUICreatingAndCombiningViews
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            // 1. Map
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            // 2. Image
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            // 3. Content
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)

                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                } //: HSTACK
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Descriptive text goes here.")
            } //: VSTACK
            .padding()

            Spacer()
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
