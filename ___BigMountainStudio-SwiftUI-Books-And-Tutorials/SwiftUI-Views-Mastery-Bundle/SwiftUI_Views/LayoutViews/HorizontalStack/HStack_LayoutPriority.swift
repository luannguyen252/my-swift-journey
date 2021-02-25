//
//  HStack_LayoutPriority.swift
//  100Views
//
//  Created by Mark Moeykens on 7/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HStack_LayoutPriority: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("HStack")
                .font(.largeTitle)
            Text("Layout Priority")
                .font(.title).foregroundColor(.gray)
            VStack(spacing: 10) {
                Text("Use the layoutPriority modifier to give priority to the space a view needs to show its content.").font(.title)
            }
            .frame(maxWidth: .infinity)
            .padding().layoutPriority(1)
            .background(Color.orange)
            .foregroundColor(.black)
            
            Text(".layoutPriority(1) is set on 'Brings Balance'")
                .padding()
            
            HStack {
                Text("SwiftUI")
                    .font(.largeTitle).lineLimit(1) // Don't let text wrap
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("Brings Balance")
                    .font(.largeTitle)
                    .layoutPriority(1) // Truncate last
            }
            .padding(.horizontal)
            Divider()
            HStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .layoutPriority(1) // Truncate last
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("Brings Balance")
                    .font(.largeTitle).lineLimit(1) // Don't let text wrap
            }
            .padding(.horizontal)
            
            Text(".layoutPriority(1) is set on 'SwiftUI'")
                .padding()
        }
    }
}

struct HStack_LayoutPriority_Previews: PreviewProvider {
    static var previews: some View {
        HStack_LayoutPriority()
    }
}
