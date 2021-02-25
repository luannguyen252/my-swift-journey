//
//  ZStack_1_01.swift
//  100Views
//
//  Created by Mark Moeykens on 6/15/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ZStack_IgnoreSafeAreaEdges : View {
    var body: some View {
        ZStack {
            Color.gray
            
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                
                Text("Ignores Safe Area Edges")
                    .foregroundColor(.white)
                
                Text("Ignoring the Safe Areas edges will extend a view to fill the whole scene.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    
            }
            .font(.title)
        }
        .ignoresSafeArea(.all) // Ignore the safe areas
    }
}

struct ZStack_IgnoreSafeAreaEdges_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ZStack_IgnoreSafeAreaEdges()
        }
    }
}
