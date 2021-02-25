//
//  HorizontalStack.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HorizontalStack: View {
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
        }
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: 10))
        .padding()
        .frame(height: 250)
    }
}

struct HorizontalStack_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStack()
    }
}
