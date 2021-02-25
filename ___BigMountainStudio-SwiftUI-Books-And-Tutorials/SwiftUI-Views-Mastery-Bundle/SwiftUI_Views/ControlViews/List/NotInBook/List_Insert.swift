//
//  List_Insert.swift
//  100Views
//
//  Created by Mark Moeykens on 6/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_Insert : View {
    @State private var newToDo = ""
    
    @State var data = ["Practice Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    
    var body: some View {
        List {
            Section(header:
                VStack {
                    Text("To Do").font(.title)
                    HStack {
                        TextField("new todo", text: $newToDo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            self.data.append(self.newToDo)
                            self.newToDo = ""
                        }) {
                            Image(systemName: "plus.circle.fill").font(.title).padding(.leading)
                        }
                    }
                }.padding()
            ) {
                ForEach(data, id: \.self) { datum in
                    Text(datum).font(Font.system(size: 24)).padding()
                }
                    // Can't seem to get this to trigger.
                    .onInsert(of: data) { (insertIndex, _: [NSItemProvider]) in
                        print("data first: \(self.data.first ?? "No first data")")
                        print("insertIndex: \(insertIndex)")
                }
            }
        }
    }
}

#if DEBUG
struct List_Insert_Previews : PreviewProvider {
    static var previews: some View {
        List_Insert()
    }
}
#endif
