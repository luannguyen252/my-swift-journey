//
//  CheckBox.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct CheckBox: View {
    @State private var selected: Bool = false
    var title: String = "untitled"
    
    var body: some View {
        HStack {
            Image(systemName: selected ? "checkmark.square" : "square")
            Text("\(title)")
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
