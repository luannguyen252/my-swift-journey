//
//  ZStackSnippets.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct ZStackSnippets: View {
    var body: some View {
        // 1.
        ZStack {
            Color.pink
                .edgesIgnoringSafeArea(.all)
        }
        
        // 2.
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            Text("ZStack Snippets")
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
    }
}

#if DEBUG
struct ZStackSnippets_Previews: PreviewProvider {
    static var previews: some View {
        ZStackSnippets()
            .preferredColorScheme(.dark)
    }
}
#endif
