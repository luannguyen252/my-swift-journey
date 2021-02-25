//
//  Frame_PullInToPushOut.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Frame_PullInToPushOut: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Frame").font(.largeTitle)
            Text("Max Sizes").foregroundColor(.gray)
            Text("Using .infinity is a great way to turn pull-in views into push-out views.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.pink).foregroundColor(.white)
            
            Text("Pull-In View")
            Image(systemName: "arrow.right.arrow.left")
                .padding()
                .background(Color.pink)
            
            Text("Now a Push-Out View")
            Image(systemName: "arrow.right.arrow.left")
                .padding()
                // Using .infinity for max width and height makes this a push-out view now
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.pink)
        }
        .font(.title)
    }
}

struct Frame_PullInToPushOut_Previews: PreviewProvider {
    static var previews: some View {
        Frame_PullInToPushOut()
    }
}
