//
//  FixedSize_HorizontalVertical.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct FixedSize_HorizontalVertical: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Fixed Size")
                .font(.largeTitle)
            
            Text("Horizontal & Vertical")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can control whether you want the view fixed to its ideal size horizontally or vertically.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            
            Text("By default, when you use .fixedSize(), horizontal and vertical parameters are both true. Here is an example where horizontal is TRUE and vertical is FALSE:")
                .padding()

            ZStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("SwiftUI").resizable().frame(width: 180, height: 180)
                }
                Text("Welcome to SwiftUI!").italic().bold()
                    .font(Font.system(size: 40))
                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                    .padding()
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: 200, height: 180, alignment: .leading)
                    .border(Color.yellow)
            }
            
            Text("Here, horizontal is FALSE and vertical is TRUE:")
            ZStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("SwiftUI").resizable().frame(width: 180, height: 180)
                }
                Text("Welcome to SwiftUI!").italic().bold()
                    .font(Font.system(size: 40))
                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 200, height: 180, alignment: .leading)
                    .border(Color.yellow)
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct FixedSize_HorizontalVertical_Previews: PreviewProvider {
    static var previews: some View {
        FixedSize_HorizontalVertical()
    }
}
