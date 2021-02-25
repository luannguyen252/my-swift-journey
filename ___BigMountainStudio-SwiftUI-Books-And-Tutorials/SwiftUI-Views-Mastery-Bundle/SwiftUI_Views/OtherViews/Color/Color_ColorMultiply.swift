//
//  Color_2_00_ColorMultiply.swift
//  100Views
//
//  Created by Mark Moeykens on 6/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_ColorMultiply : View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Color")
                .font(.largeTitle)
            Text("Color Multiply")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can combine colors to form new colors with the color multiply modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.black)
                .font(.title)
                .minimumScaleFactor(0.5)
            
            HStack {
                Color.pink
                    .frame(width: 88, height: 88)
                
                Image(systemName: "plus")
                    .font(.title)
                
                Color.blue
                    .frame(width: 88, height: 88)
                
                Image(systemName: "equal")
                    .font(.title)
                
                Color.pink.colorMultiply(Color.blue)
                    .frame(width: 88, height: 88)
            }
            
            HStack {
                Color.yellow
                    .frame(width: 88, height: 88)
                
                Image(systemName: "plus")
                    .font(.title)
                
                Color.blue
                    .frame(width: 88, height: 88)
                
                Image(systemName: "equal")
                    .font(.title)
                
                Color.yellow.colorMultiply(Color.blue)
                    .frame(width: 88, height: 88)
            }
            
            HStack {
                Color.yellow
                    .frame(width: 88, height: 88)
                
                Image(systemName: "plus")
                    .font(.title)
                
                Color.red
                    .frame(width: 88, height: 88)
                
                Image(systemName: "equal")
                    .font(.title)
                
                Color.yellow.colorMultiply(Color.red)
                    .frame(width: 88, height: 88)
            }
        }
    }
}

struct Color_ColorMultiply_Previews : PreviewProvider {
    static var previews: some View {
        Color_ColorMultiply()
    }
}
