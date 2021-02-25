//
//  ContentView3.swift
//  SwiftUIList
//
//  Created by Alex Nagy on 24.02.2021.
//

import SwiftUI

struct ContentView3: View {
    
    @State var data: [Person] = [
        Person(name: "Alex"),
        Person(name: "Jane", children: [Person(name: "Kate"), Person(name: "Bob")]),
        Person(name: "John", children: [Person(name: "Alice"), Person(name: "Ron")])
    ]
    
    var body: some View {
        List(data, children: \.children) { person in
            CustomRow(string: person.name)
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}

struct Person: Identifiable {
    var id = UUID()
    var name = ""
    var children: [Person]?
}
