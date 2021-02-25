//
//  List_MoveRow.swift
//  100Views
//
//  Created by Mark Moeykens on 6/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_MoveRow : View {
    @State var data = ["Hit the Edit button to reorder", "Practice Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data, id: \.self) { datum in
                    Text(datum).font(Font.system(size: 24)).padding()
                }
                .onMove(perform: moveRow)
            }
            .navigationTitle("To Do")
            .toolbar {
                ToolbarItem { EditButton() }
            }
        }
        .accentColor(.green) // Changes color of buttons
    }
    
    func moveRow(from indexes: IndexSet, to destination: Int) {
        if let first = indexes.first {
            data.insert(data.remove(at: first), at: destination)
        }
    }
}

struct List_MoveRow_Previews : PreviewProvider {
    static var previews: some View {
        List_MoveRow()
    }
}
