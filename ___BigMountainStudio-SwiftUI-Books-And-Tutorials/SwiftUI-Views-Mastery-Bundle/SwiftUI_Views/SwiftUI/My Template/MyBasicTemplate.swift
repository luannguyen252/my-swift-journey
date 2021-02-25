//
//  TemplateExample.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct MyBasicTemplate: View {
    var body: some View {
        VStack(spacing: 20) { // 20 points of space between each item in the VStack
            Text("Title") // Shows text on the screen
                .font(.largeTitle) // Format text to be largest
            
            Text("Subtitle")
                .font(.title) // Format text to be second largest
                .foregroundColor(.gray) // Change color of text to gray
            
            Text("Short description of what I am demonstrating goes here.")
                .frame(maxWidth: .infinity) // Extend until you can't go anymore
                .padding() // Add space all around this text
                .font(.title) // Format text to be second largest
                .background(Color.blue) // Add the color blue behind the text
                .foregroundColor(Color.white) // Change text color to white
                .layoutPriority(1)
                
            Text("(Content of what I am demonstrating goes here.)")
                .font(.title)
            
        }
    }
}

struct MyBasicTemplate_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicTemplate()
    }
}
