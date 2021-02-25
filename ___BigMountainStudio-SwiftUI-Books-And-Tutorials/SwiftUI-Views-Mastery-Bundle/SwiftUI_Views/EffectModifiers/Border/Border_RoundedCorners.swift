//
//  Border_RoundedCorners.swift
//  100Views
//
//  Created by Mark Moeykens on 8/28/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Border_RoundedCorners: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Border")
                .font(.largeTitle)
            Text("Rounded Borders")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Notice what happens when you apply the corner radius to a border.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Button("Rounded Corner Button", action: {})
                .padding()
                .border(Color.purple, width: 5)
                .cornerRadius(15)
            
            Text("If you want a border with rounded corners then you will have to use a RoundedRectangle or Capsule with a stroke.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Button("Button with RoundedRectangle", action: {})
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.purple, lineWidth: 5))
            
            Button("Button with Capsule", action: {})
                .padding()
                .background(Capsule()
                    .stroke(Color.purple, lineWidth: 5))
        }
        .minimumScaleFactor(0.5)
    }
}

struct Border_RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        Border_RoundedCorners()
    }
}
