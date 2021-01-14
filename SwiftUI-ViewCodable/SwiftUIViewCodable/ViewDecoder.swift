//
//  ViewDecoder.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 03/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import SwiftUI

enum ViewType:String,Codable {
    case group = "Group"
    case hstack = "HStack"
    case vstack = "VStack"
    case zstack = "ZStack"
    case spacer = "Spacer"
    case text = "Text"
    
    func needsChildren() -> Bool {
        switch self {
        case .group,.hstack,.vstack,.zstack:
            return true
        default:
            return false
        }
    }
}

struct ViewNode {
    var type:ViewType
    var children:[ViewNode]
    var modifiers:[Modifier]
}

struct ViewDecoder {
    func viewForNode(_ node:ViewNode) -> AnyView {
        let childrenView = viewsForNodes(node.children)
        switch node.type {
        case .group:
            return AnyView(Group{childrenView})
        case .hstack:
            return AnyView(HStack{childrenView})
        case .vstack:
            return AnyView(VStack{childrenView})
        case .zstack:
            return AnyView(ZStack{childrenView})
        case .spacer:
            return AnyView(Spacer())
        case .text:
            return AnyView(Text("test"))
        
        }
    }
    
    func viewsForNodes(_ nodes:[ViewNode]) -> some View {
        ForEach(0..<nodes.count) {
            self.viewForNode(nodes[$0])
        }
    }
    
}
