//
//  List_ListRowBackground.swift
//  100Views
//
//  Created by Mark Moeykens on 6/29/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    var action = ""
    var due = ""
    var isIndented = false
}

struct List_ListRowBackground : View {
    @State private var newToDo = ""
    
    @State var data = [
        Todo(action: "Practice Coding", due: "Today"),
        Todo(action: "Grocery shopping", due: "Today"),
        Todo(action: "Get tickets", due: "Tomorrow"),
        Todo(action: "Clean house", due: "Next Week"),
        Todo(action: "Do laundry", due: "Next Week"),
        Todo(action: "Cook dinner", due: "Next Week"),
        Todo(action: "Paint room", due: "Next Week")
    ]
    
    var body: some View {
        List {
            Section(header:
                VStack {
                    Text("To Do").font(.title)
                    HStack {
                        TextField("new todo", text: $newToDo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            self.data.append(Todo(action: self.newToDo))
                            self.newToDo = ""
                        }) {
                            Image(systemName: "plus.circle.fill").font(.title)
                        }
                    }
                }
                .padding(
                    EdgeInsets(top: 50, leading: 16, bottom: 16, trailing: 16))
            ) {
                ForEach(data) { datum in
                    Text(datum.action)
                        .font(Font.system(size: 24))
                        .foregroundColor(self.getTextColor(due: datum.due))
                        // Turn row green if due today
                        .listRowBackground(datum.due == "Today" ? Color.green : Color.clear)
                        .padding()
                }
            }
        }
        .padding(.top, -48)
        .ignoresSafeArea(edges: .vertical)
    }
    
    // This logic was inline but the compiler said it was "too complex" 🤷‍♂️
    func getTextColor(due: String) -> Color {
        due == "Today" ? Color.black : Color.primary
    }
}

struct List_ListRowBackground_Previews : PreviewProvider {
    static var previews: some View {
        List_ListRowBackground()
    }
}
