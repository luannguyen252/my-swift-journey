//
//  Scale_Anchor.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scale_Anchor: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Scale Effect").font(.largeTitle)
                Text("Anchor").font(.title).foregroundColor(.gray)
                Text("Scaling happens from the center point. But you can scale from different points in a view by using the anchor parameter.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.pink)
                    .layoutPriority(1)
                Text("(Frames shown for clarity)")
                VStack(spacing: 60) {
                    Text("topLeading")
                        .scaleEffect(2.0, anchor: .topLeading)
                        .border(Color.pink)
                    Text("top")
                        .scaleEffect(2.0, anchor: .top)
                        .border(Color.pink)
                    Text("trailing")
                        .scaleEffect(2.0, anchor: .trailing)
                        .border(Color.pink)
                    Text("leading")
                        .scaleEffect(2.0, anchor: .leading)
                        .border(Color.pink)
                    Text("bottom")
                        .scaleEffect(2.0, anchor: .bottom)
                        .border(Color.pink)
                    Text("bottomTrailing")
                        .scaleEffect(2.0, anchor: .bottomTrailing)
                        .border(Color.pink)
                }
            }
        }
    }
}

struct Scale_Anchor_Previews: PreviewProvider {
    static var previews: some View {
        Scale_Anchor()
    }
}
