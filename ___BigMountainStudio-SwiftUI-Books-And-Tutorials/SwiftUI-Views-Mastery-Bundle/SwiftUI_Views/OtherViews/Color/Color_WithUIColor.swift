//
//  Color_WithUIColor.swift
//  100Views
//
//  Created by Mark Moeykens on 9/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_WithUIColor: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Color")
                .font(.largeTitle)
            
            Text("Using UIColor")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("It should be mentioned that the Color view can also access colors from UIColor.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .font(.title).foregroundColor(.black)
            
            HStack {
                Spacer()
                Text("SwiftUI   ")
                Spacer()
                Text("   UIColor")
                Spacer()
            }.font(.title)
            
            SecondEightRows()
                .padding(.horizontal)
        }
    }
}

struct Color_WithUIColor_Previews: PreviewProvider {
    static var previews: some View {
        Color_WithUIColor()
    }
}

struct SecondEightRows: View {
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(UIColor.gray))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.red)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(UIColor.red))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.green))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.blue))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.orange))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.yellow)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.yellow))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.pink)
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .overlay(Text("(None)"))
            }
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.purple)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(.purple))
            }
        }
    }
}
