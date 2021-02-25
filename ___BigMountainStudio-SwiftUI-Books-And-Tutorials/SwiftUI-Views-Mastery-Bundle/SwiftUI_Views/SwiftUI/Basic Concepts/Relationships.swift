//
//  Relationships.swift
//  100Views
//
//  Created by Mark Moeykens on 9/28/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Relationships: View {
    var body: some View {
        VStack {
            Text("Parent")
                .font(.largeTitle)
            HStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .overlay(Text("Child"))
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .overlay(Text("Child"))
            }
            .font(.largeTitle)
            .padding(24)
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: 10))
            .padding()
        }
        .padding(.vertical, 200)
    }
}

struct Relationships_Previews: PreviewProvider {
    static var previews: some View {
        Relationships()
    }
}
