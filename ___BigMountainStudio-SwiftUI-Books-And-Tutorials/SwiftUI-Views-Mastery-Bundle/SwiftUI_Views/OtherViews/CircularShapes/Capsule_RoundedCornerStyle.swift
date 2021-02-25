//
//  Capsule_Rounded.swift
//  100Views
//
//  Created by Mark Moeykens on 9/14/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Capsule_RoundedCornerStyle: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Capsule")
                .font(.largeTitle)
            
            Text("Rounded Corner Style")
                .foregroundColor(.gray)
            
            Text("The Capsule shape offers two different styles for its rounded corners:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            Text("RoundedCornerStyle.circular")
            
            Capsule(style: RoundedCornerStyle.circular)
                .padding()
            
            Text("RoundedCornerStyle.continuous")
            
            Capsule(style: RoundedCornerStyle.continuous)
                .padding()
        }
        .font(.title)
    }
}

struct Capsule_RoundedCornerStyle_Previews: PreviewProvider {
    static var previews: some View {
        Capsule_RoundedCornerStyle()
    }
}
