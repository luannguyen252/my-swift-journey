//
//  Invert_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_Inverting: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Color").font(.largeTitle)
            Text("Inverting").font(.title).foregroundColor(.gray)
            Text("Using the colorInvert modifier you can increase your choices from the system color pallet.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .layoutPriority(1)
                .foregroundColor(.black)
            
            HStack {
                Spacer()
                Text("System")
                Spacer()
                Text("Inverted")
                Spacer()
            }.font(.title)
            
            
            Group {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .overlay(Text("Gray").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.red)
                        .overlay(Text("Red").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.red)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .overlay(Text("Green").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .overlay(Text("Blue").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.orange)
                        .overlay(Text("Orange").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.orange)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.yellow)
                        .overlay(Text("Yellow").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.yellow)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.pink)
                        .overlay(Text("Pink").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.pink)
                        .colorInvert()
                }
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.purple)
                        .overlay(Text("Purple").foregroundColor(.black))
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.purple)
                        .colorInvert()
                }
            }.padding(.horizontal)
        }
    }
}

struct Color_Inverting_Previews: PreviewProvider {
    static var previews: some View {
        Color_Inverting()
    }
}
