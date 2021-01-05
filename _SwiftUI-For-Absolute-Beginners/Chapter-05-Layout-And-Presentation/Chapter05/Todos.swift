//
//  Todos.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI


let todos = [
    "Check email",
    "Feed the dogs",
    "Write another chapter",
    "Watch another episode",
    "Add more images to the chapters",
    "Walk for 30 minutes"
]

struct Todos: View {
    @State private var selected: Bool = false
    var title: String = "untitled"
    
    var body: some View {
        HStack {
            Image(systemName: selected ? "checkmark.square" : "square")
            Text("\(title)")
                .strikethrough(selected, color: Color.red)
        }.onTapGesture {
            self.selected.toggle()
        }
    }
}

struct TodoView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<todos.count) { index in
                    Todos(title: todos[index])
                }
            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
