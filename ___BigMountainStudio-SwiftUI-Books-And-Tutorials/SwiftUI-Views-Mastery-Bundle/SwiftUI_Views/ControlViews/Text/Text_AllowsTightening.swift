//
//  Text_Tightening_Truncation.swift
//  100Views
//
//  Created by Mark Moeykens on 6/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_AllowsTightening : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Allows Tightening")
                .font(.title)
                .foregroundColor(.gray)
            
            Image("AllowsTightening")
            Text("You might want to tighten up some text that might be too long.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .font(.title)
            
            Text("In the example below, the green has .allowTightening(true):")
                .font(.title)
            
            Group {
                Text("Allows tightening to allow text to fit in one line.")
                    .foregroundColor(.red)
                    .allowsTightening(false)
                    .padding(.horizontal)
                    .lineLimit(1)
                Text("Allows tightening to allow text to fit in one line.")
                    .foregroundColor(.green)
                    .allowsTightening(true)
                    .padding(.horizontal)
                    .lineLimit(1)
            }.padding(.horizontal)
        }
    }
}

struct Text_AllowsTightening_Previews : PreviewProvider {
    static var previews: some View {
        Text_AllowsTightening()
    }
}
