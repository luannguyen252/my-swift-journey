//
//  List_Delete.swift
//  100Views
//
//  Created by Mark Moeykens on 6/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_Delete : View {
    @State var data = ["Swipe to Delete", "Practice Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    
    var body: some View {
        List {
            Section(header: Text("To Do").padding()) {
                ForEach(data, id: \.self) { datum in
                    Text(datum).font(Font.system(size: 24)).padding()
                }
                .onDelete(perform: delete) // Enables swipe to delete
            }
        }
    }
    
    func delete(at indexes: IndexSet) {
        if let first = indexes.first {
            data.remove(at: first)
        }
    }
}

struct List_Delete_Previews : PreviewProvider {
    static var previews: some View {
        List_Delete()
    }
}
