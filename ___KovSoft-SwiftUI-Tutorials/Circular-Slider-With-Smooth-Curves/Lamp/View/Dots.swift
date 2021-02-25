//
//  Dots.swift
//  Lamp
//
//  Created by Balaji on 01/12/20.
//

import SwiftUI

struct Dots: View {
    var width = UIScreen.main.bounds.width / 2
    var body: some View {
        ForEach(0...10,id: \.self){index in
            
            Circle()
                .fill(Color("yellow"))
                .frame(width: 10, height: 10)
            // moving view left
            // and rotating view as per angle...
                .offset(x: -(width + 32) / 2)
                .rotationEffect(.init(degrees: Double(index) * 24))
        }
        .rotationEffect(.init(degrees: -30))
    }
}

