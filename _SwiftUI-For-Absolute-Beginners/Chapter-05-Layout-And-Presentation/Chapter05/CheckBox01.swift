//
//  CheckBox01.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct CheckBox01: View {
    @State private var selected: Bool = false
    var title: String = "untitled"
    
    var body: some View {
        HStack {
            Image(systemName: selected ? "checkmark.square" : "square")
            Text("\(title)")
        }.onTapGesture {
            self.selected.toggle()
        }
    }
}

struct CheckBox01_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox01()
    }
}
