//
//  ViewSizes_Push_Out.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ViewSizes_Push_Out: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layout Behavior")
            Text("Views that Push Out")
                .font(.title).foregroundColor(.gray)
            Text("Some views will push out to fill up all available space within their parent.")
                .frame(maxWidth: .infinity).padding().font(.title)
                .background(Color.purple)
            
            Color.purple
                // Add five layers on top of the color
                .overlay(
                    Image(systemName: "arrow.up.left")
                        .padding() // Add spacing around the symbol
                    , alignment: .topLeading) // Align within the layer
                .overlay(
                    Image(systemName: "arrow.up.right")
                        .padding(), alignment: .topTrailing)
                .overlay(
                    Image(systemName: "arrow.down.left")
                        .padding(), alignment: .bottomLeading)
                .overlay(
                    Image(systemName: "arrow.down.right")
                        .padding(), alignment: .bottomTrailing)
                .overlay(Text("Colors are Push-Out views"))
        }.font(.largeTitle) // Make all text and symbols larger
    }
}

struct ViewSizes_Push_Out_Previews: PreviewProvider {
    static var previews: some View {
        ViewSizes_Push_Out()
    }
}
