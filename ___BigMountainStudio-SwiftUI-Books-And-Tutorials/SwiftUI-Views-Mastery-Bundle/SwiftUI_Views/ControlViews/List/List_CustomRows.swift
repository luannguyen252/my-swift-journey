//
//  List_CustomRows.swift
//  100Views
//
//  Created by Mark Moeykens on 6/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_CustomRows : View {
    var data = ["Custom Rows!", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo"]
    
    var body: some View {
        List(data, id: \.self) { datum in
            CustomRow(content: datum)
        }
    }
}

struct CustomRow: View {
    var content: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            Text(content)
            Spacer()
        }
        .foregroundColor(content == "Custom Rows!" ? Color.green : Color.primary)
        .font(.title)
        .padding([.top, .bottom])
    }
}

#if DEBUG
struct List_CustomRows_Previews : PreviewProvider {
    static var previews: some View {
        List_CustomRows()
    }
}
#endif
