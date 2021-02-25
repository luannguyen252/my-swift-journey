//
//  Frame_Alignment.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Frame_Alignment: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Frame")
                .font(.largeTitle)
            
            Text("Alignment")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("The frame modifier allows you to align the content within a frame (if there is available space). The alignment won't work on views that push out to fill all available space, like shapes.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
            
            HStack {
                Button(action: {}) {
                    Text("Button")
                }
                .frame(width: 150, height: 150, alignment: .top)
                .border(Color.pink)
                Button(action: {}) {
                    Text("Button")
                }
                .frame(width: 150, height: 150, alignment: .trailing)
                .border(Color.pink)
            }
            HStack {
                Button(action: {}) {
                    Text("Button")
                }
                .frame(width: 150, height: 150, alignment: .leading)
                .border(Color.pink)
                Button(action: {}) {
                    Text("Button")
                }
                .frame(width: 150, height: 150, alignment: .bottom)
                .border(Color.pink)
            }
        }
    }
}

struct Frame_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        Frame_Alignment()
    }
}
