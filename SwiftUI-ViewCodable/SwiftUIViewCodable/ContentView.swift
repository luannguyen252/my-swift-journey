//
//  ContentView.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 02/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var nodes = [ViewNode(type: .group,
                          children: ContentView.makeNodes(),
                          modifiers: [])]
    var viewDecoder = ViewDecoder()
    
    var body: some View {
        viewDecoder.viewsForNodes(nodes)
    }
}

extension ContentView {
    static func makeNodes() -> [ViewNode] {
        let textNode1 = ViewNode(type: .text, children: [], modifiers: [.font(size: 30)])
        let textNode2 = ViewNode(type: .text, children: [], modifiers: [.font(size: 10)])
        return [textNode1, textNode2]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
