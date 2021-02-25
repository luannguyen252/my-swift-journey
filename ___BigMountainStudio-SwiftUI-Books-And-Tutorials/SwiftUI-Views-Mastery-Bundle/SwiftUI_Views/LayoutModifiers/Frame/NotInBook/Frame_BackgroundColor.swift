//
//  Frame_BackgroundColor.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 12/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Frame_BackgroundColor: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Frame")
                .font(.largeTitle)
            
            Text("Background: maxWidth & maxHeight")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can use the frame modifier to extend a background color.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .foregroundColor(.white)
            
            Spacer()
        }
        // Here is yet another way in which you can set a background color.
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Color(UIColor.systemGray5).ignoresSafeArea())
    }
}

struct Frame_BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        Frame_BackgroundColor()
    }
}
