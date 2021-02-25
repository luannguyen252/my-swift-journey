//
//  Clipped_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Clipped_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Clipped").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Cut off any part of the view's content that goes outside of the frame.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .foregroundColor(.white)
            HStack {
                VStack {
                    Text("Before")
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 150, height: 80)
                        .offset(x: 20, y: 20)
                        .border(Color.red)
                }
                VStack {
                    Text("After")
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 150, height: 80)
                        .offset(x: 20, y: 20)
                        .border(Color.red)
                        .clipped()
                }
            }.padding(.bottom, 30)
            
            HStack(spacing: 50) {
                Image("yosemite")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 80)
                    .border(Color.red)
                
                Image("yosemite")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 80)
                    .border(Color.red)
                    .clipped()
                
            }.padding(.leading, 40)
            
            Text("Also note, applying a cornerRadius modifier will also clip a view:")
                .padding(.top)
                .layoutPriority(2)
            
            Image("yosemite")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 80)
                .cornerRadius(15)
        }
        .minimumScaleFactor(0.5)
    }
}

struct Clipped_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Clipped_Intro()
    }
}
