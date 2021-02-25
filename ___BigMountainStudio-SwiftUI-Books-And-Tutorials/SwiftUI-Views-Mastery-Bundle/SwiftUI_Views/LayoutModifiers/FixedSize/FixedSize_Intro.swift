//
//  FixedSize_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct FixedSize_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Fixed Size")
                .font(.largeTitle)
            
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("The fixed size modifier allows content to extend past the bounds of its parent container.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.yellow)
                .layoutPriority(1)
            
            Text("The text below stays within the bounds of the frame that is set.")
            ZStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("SwiftUI")
                        .resizable()
                        .frame(width: 180, height: 180)
                }
                
                Text("Welcome to SwiftUI!").italic().bold()
                    .font(Font.system(size: 40))
                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                    .padding()
                    .frame(width: 200, height: 180, alignment: .leading)
                    .border(Color.yellow)
            }
            
            Text("If you add the fixedSize modifier, it will allow the text to go untruncated and extend to its ideal size.")
            ZStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("SwiftUI")
                        .resizable()
                        .frame(width: 180, height: 180)
                }
                
                Text("Welcome to SwiftUI!").italic().bold()
                    .font(Font.system(size: 40))
                    .fixedSize()
                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                    .padding()
                    .frame(width: 200, height: 180, alignment: .leading)
                    .border(Color.yellow)
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct FixedSize_Intro_Previews: PreviewProvider {
    static var previews: some View {
        FixedSize_Intro()
    }
}
