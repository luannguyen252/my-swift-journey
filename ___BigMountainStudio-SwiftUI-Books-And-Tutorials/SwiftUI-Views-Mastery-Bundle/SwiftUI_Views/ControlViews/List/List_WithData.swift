//
//  List_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_WithData : View {
    var stringArray = ["This is the simplest List", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo", "Notice the automatic wrapping when the text is longer"]
    
    var body: some View {
        List(stringArray, id: \.self) { string in
            Text(string)
        }
        .font(.title) // Apply this font style to all items in the list
    }
}

struct List_WithData_Previews : PreviewProvider {
    static var previews: some View {
        List_WithData()
    }
}
