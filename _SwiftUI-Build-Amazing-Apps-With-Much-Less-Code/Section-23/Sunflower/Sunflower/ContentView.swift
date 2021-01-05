//
//  ContentView.swift
//  Sunflower
//
//  Created by Stephen DeStefano on 9/11/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            ZStack {
                Rectangle().edgesIgnoringSafeArea([.all])
                OuterPetalView()
                
                ZStack {
                    OuterPetalView()
                    InnerCircleView()
                }.rotation3DEffect(Angle(degrees: 105), axis: (x: 0, y: 0, z: 1))
                    .scaleEffect(0.75)
            }
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
