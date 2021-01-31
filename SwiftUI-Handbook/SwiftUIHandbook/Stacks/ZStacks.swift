//
//  ZStacks.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct ZStacks: View {
    var body: some View {
        ZStack() {
            Text("1")
                .frame(width: 300, height: 300, alignment: .leading)
                .foregroundColor(.white)
                .background(Color.red)
                
            Text("2")
                .frame(width: 200, height: 200, alignment: .leading)
                .foregroundColor(.white)
                .background(Color.green)
                
            Text("3")
                .frame(width: 100, height: 100, alignment: .leading)
                .foregroundColor(.white)
                .background(Color.black)
        }
    }
}

struct ZStacks_Previews: PreviewProvider {
    static var previews: some View {
        ZStacks()
    }
}
