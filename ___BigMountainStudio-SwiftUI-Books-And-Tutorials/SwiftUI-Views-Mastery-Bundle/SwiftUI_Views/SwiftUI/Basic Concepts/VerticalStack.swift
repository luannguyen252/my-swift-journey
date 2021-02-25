//
//  VerticalStack.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct VerticalStack: View {
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
        }
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: 4))
        .padding()
    }
}

struct VerticalStack_Previews: PreviewProvider {
    static var previews: some View {
        VerticalStack()
    }
}
