//
//  HStacks.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct HStacks: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Text("First View")
            Text("Second View")
            Text("Third View")
        }
    }
}

struct HStacks_Previews: PreviewProvider {
    static var previews: some View {
        HStacks()
    }
}
