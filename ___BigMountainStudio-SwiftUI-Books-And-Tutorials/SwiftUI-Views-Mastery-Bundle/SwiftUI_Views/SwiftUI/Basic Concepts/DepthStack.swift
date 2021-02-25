//
//  DepthStack.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DepthStack: View {
    var body: some View {
        GeometryReader { gr in
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .offset(x: -40, y: -40)
                    .frame(width: gr.size.width - 120, height: gr.size.height - 270)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .shadow(radius: 8)
                    .frame(width: gr.size.width - 120, height: gr.size.height - 270)

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .offset(x: 40, y: 40)
                    .shadow(radius: 8)
                    .frame(width: gr.size.width - 120, height: gr.size.height - 270)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.orange, lineWidth: 2))
            .padding()
        }
    }
}

struct DepthStack_Previews: PreviewProvider {
    static var previews: some View {
        DepthStack()
    }
}
