//
//  ContextMenu_ConditionallyShowing.swift
//  100Views
//
//  Created by Mark Moeykens on 8/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ContextMenu_ConditionallyShowing: View {
    @State private var image: Image? = nil
    
    private var imageOptions = ContextMenu {
        Button(action: {}) {
            Text("Replace")
            Image(systemName: "square.on.square")
        }
        Button(action: {}) {
            Text("Share")
            Image(systemName: "square.and.arrow.up")
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ContextMenu").font(.largeTitle)
            Text("Conditionally Showing").font(.title).foregroundColor(.gray)
            Text("You might want to show the ContextMenu only under some condition. This can be done by using a different .contextMenu modifier and return a menu.")
                .frame(maxWidth: .infinity)
                .padding().font(.title).layoutPriority(1)
                .background(Color.orange).foregroundColor(Color.white)
            
            Button(action: {
                // Open image picker
                // For now just set an image
                self.image = Image("valley")
            }) {
                Text(image == nil ? "Select Image" : "Long-press to edit")
            }
            .frame(width: 200, height: 200)
            .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray, style: StrokeStyle(lineWidth: 4, dash: [10, 10])))
            .background(image == nil ? nil : image)
            .contextMenu(image == nil ? nil : imageOptions)
        }
    }
}

struct ContextMenu_ConditionallyShowing_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu_ConditionallyShowing()
    }
}
