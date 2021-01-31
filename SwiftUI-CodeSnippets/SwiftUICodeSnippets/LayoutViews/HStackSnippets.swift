//
//  HStackSnippets.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct HStackSnippets: View {
    var body: some View {
        // 1.
        HStack(spacing: 16) {
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
        
        // 2.
        HStack(spacing: 16) {
            Text("Hello, World!")
            Spacer()
            Text("Hello, World!")
            Spacer()
            Text("Hello, World!")
        }
    }
}

#if DEBUG
struct HStackSnippets_Previews: PreviewProvider {
    static var previews: some View {
        HStackSnippets()
    }
}
#endif
