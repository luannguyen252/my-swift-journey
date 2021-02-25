//
//  Scale_ContentNotFrame.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scale_FramesAndContent: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Scale Effect").font(.largeTitle)
                Text("Frames & Content")
                    .font(.title).foregroundColor(.gray)
                Text("Notice when scaling, it is the content that is affected, not the frame. The frame size is unchanged.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.pink)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                Group {
                    Text("Before")
                    Text("Scale This")
                        .font(.title)
                        .border(Color.pink)
                    Text("After (3X)")
                    Text("Scale This")
                        .font(.title)
                        .scaleEffect(3)
                        .border(Color.pink)
                    
                    Divider().padding(.top)
                    Text("Before")
                    Image("yosemite")
                        .border(Color.pink)
                    Text("After (1.6X)")
                    Image("yosemite")
                        .scaleEffect(1.6)
                        .border(Color.pink)
                }
            }
        }
    }
}

struct Scale_FramesAndContent_Previews: PreviewProvider {
    static var previews: some View {
        Scale_FramesAndContent()
    }
}
