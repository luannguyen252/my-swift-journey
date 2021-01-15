//
//  LegoBlock.swift
//  lego
//
//  Created by Shivam Vijaywargiya on 20/07/20.
//

import SwiftUI

struct LegoBlock: View {
    var color: Color
    
    var body: some View {
        Rectangle().fill(color)
            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .mask(Image("cube"))
            .overlay(Image("cube").opacity(color == Color(.clear) ? 0 : 0.5))
    }
}

struct LegoBlock_Previews: PreviewProvider {
    static var previews: some View {
        LegoBlock(color: Color.red)
    }
}
