//
//  VStackWithSpacing.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct VStackWithSpacing: View {
    var body: some View {
        // 1.
        VStack(alignment: .leading, spacing: 16) {
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
        
        // 2.
        VStack(alignment: .trailing, spacing: 16) {
            Text("Hello, World!")
            Spacer()
            Text("Hello, World!")
            Spacer()
            Text("Hello, World!")
        }
    }
}

#if DEBUG
struct VStackWithSpacing_Previews: PreviewProvider {
    static var previews: some View {
        VStackWithSpacing()
    }
}
#endif
