//
//  GroupBoxes.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct GroupBoxes: View {
    
    var body: some View {
        VStack(spacing: 16) {
            GroupBox(label: Text("Group Box Label 1")) {
                Text("Group Box Content 1")
            }
            
            GroupBox(label: Text("Group Box Label 2")) {
                Text("Group Box Content 2")
            }
            
            GroupBox(label: Text("Group Box Label 3")) {
                Text("Group Box Content 3")
            }
            
            GroupBox(label: Text("Group Box Label 4")) {
                Text("Group Box Content 4")
            }
            
            GroupBox(label: Text("Group Box Label 5")) {
                Text("Group Box Content 5")
            }
        }
        .padding()
    }
}

struct GroupBoxes_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxes()
    }
}
