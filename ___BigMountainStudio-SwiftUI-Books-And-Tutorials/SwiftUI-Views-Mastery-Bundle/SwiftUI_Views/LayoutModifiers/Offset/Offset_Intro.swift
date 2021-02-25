//
//  Offset_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Offset_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Offset").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Use the offset modifier to move a view from its original position using the X and Y coordinate values. ")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.green)
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.green)
                    .frame(width: 200, height: 100)
                    .shadow(radius: 5)
                    .offset(x: -20, y: -20)
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.green)
                    .frame(width: 200, height: 100)
                    .shadow(radius: 5)
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.green)
                    .frame(width: 200, height: 100)
                    .shadow(radius: 5)
                    .offset(x: 20, y: 20)
            }
            .padding()
            
            Text("Note, only the contents of the view are offset, not the view itself. The location of the original view remains the same. The red border shows the actual location of the rectangle's frame.")
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.green)
                .frame(width: 200, height: 100)
                .shadow(radius: 5)
                .offset(x: 40, y: 40)
                .border(Color.red)
                .padding(.bottom, 40)
        }
    }
}

struct Offset_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Offset_Intro()
    }
}
