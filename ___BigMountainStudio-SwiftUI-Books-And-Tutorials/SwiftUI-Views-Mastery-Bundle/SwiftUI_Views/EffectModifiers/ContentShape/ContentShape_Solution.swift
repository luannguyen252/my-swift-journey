//
//  ContentShape_Solution.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 10/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ContentShape_Solution: View {
    @State private var likes = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Content Shape").font(.largeTitle)
            Text("Solution").foregroundColor(.gray)
            Text("To fix this, you could add a solid color RoundedRectangle as a background shape. But if you don't want to do that, then add a contentShape modifier.")
                .frame(maxWidth: .infinity)
                .padding().foregroundColor(.white)
                .background(Color.pink)
            VStack(spacing: 20) {
                Image(systemName: likes > 0 ? "heart.fill" : "heart")
                    .foregroundColor(likes > 0 ? .red : .gray)
                    .frame(width: 100, height: 100)
                Text("Hit me! (Likes: \(likes))")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 1))
            .contentShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                self.likes = self.likes + 1
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct ContentShape_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ContentShape_Solution()
    }
}
