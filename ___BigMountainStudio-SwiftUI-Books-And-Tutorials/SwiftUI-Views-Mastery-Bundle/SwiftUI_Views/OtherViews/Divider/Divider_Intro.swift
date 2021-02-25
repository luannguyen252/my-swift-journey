//
//  Divider_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/15/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Divider_Intro : View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Divider")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Dividers are easy to implement")
                .frame(maxWidth: .infinity).padding()
                .background(Color.green).foregroundColor(Color.white)
                .font(.title)
            
            Text("Horizontal Divider")
            
            Divider()
            Image(systemName: "arrow.left.and.right")
                .font(.system(size: 60))
            Divider()
            
            Text("It is horizontal because it is in a VStack. It will be vertical if in an HStack")
                .frame(maxWidth: .infinity).padding()
                .background(Color.green).foregroundColor(Color.white)
                .font(.title)
            
            HStack {
                Text("Vertical Divider")
                Divider()
                Image(systemName: "arrow.up.and.down")
                    .font(.system(size: 60))
                Divider()
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct Divider_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Divider_Intro()
    }
}
