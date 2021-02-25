//
//  List_RowBackgroundImage.swift
//  100Views
//
//  Created by Mark Moeykens on 6/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct List_RowBackgroundImage : View {
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
                // Header
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
                .padding(EdgeInsets(top: 50, leading: 16, bottom: 16, trailing: 16))
                .background(Image("GradientHeader"))
                .foregroundColor(.white)
            ) { // Rows
                ForEach(data) { datum in
                    Text(datum.action).font(Font.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .listRowBackground(Image("GradientBackground"))
            // Can't find a way to place views behind rest of list (where there are no rows).
        }
        .background(Image("GradientHeader")) // This doesn't show the image.
        .ignoresSafeArea(edges: .vertical)
    }
}

#if DEBUG
struct List_RowBackgroundImage_Previews : PreviewProvider {
    static var previews: some View {
        List_RowBackgroundImage()
    }
}
#endif
