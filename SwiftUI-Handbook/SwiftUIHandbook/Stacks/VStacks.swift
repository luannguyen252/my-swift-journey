//
//  Stacks.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct VStacks: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("First View")
            Text("Second View")
            Text("Third View")
        }
        
        VStack(alignment: .center, spacing: 16) {
            Text("First View")
            Text("Second View")
            Text("Third View")
        }
        
        VStack(alignment: .trailing, spacing: 16) {
            Text("First View")
            Text("Second View")
            Text("Third View")
        }
    }
}

struct VStacks_Previews: PreviewProvider {
    static var previews: some View {
        VStacks()
    }
}
