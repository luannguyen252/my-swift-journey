//
//  Inset_Introduction.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Inset_Introduction: View {
    @State private var insetAmout: CGFloat = 45

    var body: some View {
        VStack(spacing: 10) {
            Text("Inset").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("Inset applies only to shapes. It allows you to add padding between the edge of the frame and the shape itself.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(.white)
            
            Text("Inset by 20")
            Circle()
                .inset(by: 20)
                .fill(Color.purple)
                .frame(width: 200)
                .border(Color.purple)
                
            Text("Slide to Adjust Inset")
            Rectangle()
                .inset(by: insetAmout)
                .fill(Color.purple)
                .frame(width: 300, height: 200)
                .border(Color.purple)
            
            HStack {
                Text("0")
                Slider(value: $insetAmout, in: 0...95)
                Text("95")
            }.padding()
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Inset_Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Inset_Introduction()
    }
}
