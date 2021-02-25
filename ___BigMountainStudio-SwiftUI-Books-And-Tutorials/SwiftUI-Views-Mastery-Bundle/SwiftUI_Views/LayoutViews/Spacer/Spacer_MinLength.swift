//
//  Spacer_MinLength.swift
//  100Views
//
//  Created by Mark Moeykens on 8/11/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spacer_MinLength: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Spacer")
                .font(.largeTitle)
            Text("Minimum Length")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can set a minimum space to exist between views using the minLength modifier on the Spacer.")
                .frame(maxWidth: .infinity)
                .padding().font(.title).background(Color.yellow)
                .foregroundColor(.black)
                .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
            
            Text("No minLength set (system default is used)")
                .bold()
            HStack {
                Image("yosemite")
                Spacer()
                Text("This is Yosemite National Park").lineLimit(1)
            }.padding()
            
            Text("minLength = 0")
                .bold()
            HStack {
                Image("yosemite")
                Spacer(minLength: 0)
                Text("This is Yosemite National Park").lineLimit(1)
            }.padding()
            
            Text("minLength = 20")
                .bold()
            HStack {
                Image("yosemite")
                Spacer(minLength: 20)
                Text("This is Yosemite National Park").lineLimit(1)
            }.padding()
        }
    }
}

struct Spacer_MinLength_Previews: PreviewProvider {
    static var previews: some View {
        Spacer_MinLength()
    }
}
