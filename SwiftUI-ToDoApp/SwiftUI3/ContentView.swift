//
//  ContentView.swift
//  SwiftUI3
//
//  Created by Rohit Saini on 28/06/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var todos:[ToDo] = [ToDo]()
    @State var task:String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("add to do",text: $task,onCommit: addToDo)
                    .padding()
                List{
                    ForEach(todos){todo in
                        Text(todo.name)
                    }
                .onDelete(perform: deleteToDo)
                }
            }
            .navigationBarTitle("To Do",displayMode: .inline)
        }
    }
    
    //Add to do Task
    private func addToDo(){
        todos.append(ToDo(name: task))
        task = ""
    }
    //Remove to do Task
    private func deleteToDo(at offsets:IndexSet){
        todos.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
