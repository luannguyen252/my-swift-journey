//
//  ContentView2.swift
//  SwiftUIList
//
//  Created by Alex Nagy on 24.02.2021.
//

import SwiftUI

struct ContentView2: View {
    
    @State var data = [
        "Element 0",
        "Element 1",
        "Element 2",
        "Element 3",
        "Element 4",
        "Element 5",
        "Element 6",
        "Element 7",
        "Element 8",
        "Element 9",
        "Element 10"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Header")) {
                    ForEach(data, id: \.self) { string in
                        CustomRow(string: string)
                    }
//                    .onDelete { (indexSet) in
//                        delete(at: indexSet)
//                    }
                    .onDelete(perform: delete)
//                    .onMove { (indexes, destination) in
//                        moveRow(from: indexes, to: destination)
//                    }
                    .onMove(perform: moveRow)
                }
            }
            .navigationTitle("Nav Bar")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
        }
    }
    
    func delete(at indexSet: IndexSet) {
        if let first = indexSet.first {
            data.remove(at: first)
        }
    }
    
    func moveRow(from indexes: IndexSet, to destination: Int) {
        if let first = indexes.first {
            data.insert(data.remove(at: first), at: destination)
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
