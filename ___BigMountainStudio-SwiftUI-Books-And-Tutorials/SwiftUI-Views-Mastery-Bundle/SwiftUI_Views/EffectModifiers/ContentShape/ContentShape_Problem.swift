//
//  ContentShape_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ContentShape_Problem: View {
    @State private var likes = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Content Shape").font(.largeTitle)
            Text("Problem").foregroundColor(.gray)
            Text("Sometimes you want to increase the size of a tappable area around content. You can use the contentShape modifier to do this.")
                .frame(maxWidth: .infinity)
                .padding().foregroundColor(.white)
                .background(Color.pink)
            Text("In this example, I want users to tap anywhere inside the red border to activate the onTapGesture. But right now it will ONLY work if they tap on content (heart, text).")
                .padding()
            VStack(spacing: 20) {
                Image(systemName: likes > 0 ? "heart.fill" : "heart")
                    .foregroundColor(likes > 0 ? .red : .gray)
                    .frame(width: 100, height: 100)
                Text("Hit me! (Likes: \(likes))")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 1))
            .onTapGesture {
                self.likes = self.likes + 1
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct ContentShape_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ContentShape_Problem()
    }
}
