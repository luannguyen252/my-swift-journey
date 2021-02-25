//
//  CornerRadius_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CornerRadius_Intro: View {
    var body: some View {
        VStack(spacing: 15) {
            Group {
                Text("Corner Radius").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Add rounded corners to any view with the cornerRadius modifier.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            
            Text("Corner radius on shapes")
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 150, height: 50)
                .cornerRadius(12)
            
            Text("Corner radius on controls")
            Button(action: {}) {
                Text("Button")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            
            Text("Corner radius on layout views")
            HStack() {
                Text("This is in an HStack")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)
            
            Text("Corner radius on images")
            Image("yosemite")
                .cornerRadius(12)
        }
        .minimumScaleFactor(0.5)
    }
}

struct CornerRadius_Intro_Previews: PreviewProvider {
    static var previews: some View {
        CornerRadius_Intro()
    }
}
