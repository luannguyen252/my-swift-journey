//
//  ContentView.swift
//  ToDoList
//
//  Created by Stephen DeStefano on 8/20/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
//THIS SORTS BY DATE
    @FetchRequest(entity: ToDoList.entity(), sortDescriptors: [
    NSSortDescriptor(keyPath: \ToDoList.dateCreated, ascending: false)])
    
//OTHER SORTING OPTIONS TO CHECK OUT...THESE WILL SORT BY PRIORITY OR BY ITEM ALPHABETICALLY
//        @FetchRequest(entity: ToDoList.entity(), sortDescriptors: [
//            NSSortDescriptor(keyPath: \ToDoList.item, ascending: true),
//            NSSortDescriptor(keyPath: \ToDoList.priority, ascending: false),
//            NSSortDescriptor(keyPath: \ToDoList.dateCreated, ascending: false)])
    
    var fetchedItems: FetchedResults<ToDoList>
    
    
    @State private var toDoItem = ""
    @State var setPriority = ""
        
        var body: some View {
            VStack {
               
             NavigationView {
               
                List {
                    
                    HStack {
                     TextField("Add new item", text: self.$toDoItem)
                        .padding(.all, 2)
                        .font(Font.system(size: 25, design: .default))
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                       Button(action: {
                        guard self.toDoItem != "" else { return } //removes the possibility of empty cells
                           let ToDoItem = ToDoList(context: self.managedObjectContext)
                               ToDoItem.item = self.toDoItem
                               ToDoItem.dateCreated = Date()
                               ToDoItem.priority = self.setPriority
                               do {
                                   try self.managedObjectContext.save()
                                  } catch {
                                       // print the Core Data error
                                       print(error.localizedDescription)
                                    }
                                      self.toDoItem = ""
                                  }){
                                     Image(systemName: "plus.circle")
                                        .foregroundColor(.white)
                                        .imageScale(.large)
                                }
                            }
               
                           Picker(selection: self.$setPriority, label: Text("")) {
                                       Text("No Rush").tag("🙂")
                                       Text("Important").tag("🤔")
                                       Text("Urgent").tag("😧")
                                       }.pickerStyle(SegmentedPickerStyle())

                    
                         ForEach(fetchedItems, id: \.self) { toDoItems in
                            
                            ItemRowView(item: toDoItems.item ?? "Empty", dateCreated: toDoItems.dateCreated!, priority: toDoItems.priority ?? "Empty")
                            //alternative "dateCreated as a string"
                            //ItemRow(item: toDoItems.item ?? "Empty", dateCreated: "\(toDoItems.dateCreated!)", priority:     toDoItems.priority ?? "Empty")
                            
                   }.onDelete(perform: removeItems)
                    //color the whole text in the list with this - .colorMultiply(Color.green).padding(.top)
                    //colors the list rows green - .listRowBackground(Color.green.opacity(0.1))
                    //or use this color initializer - Color(red: 1.0, green: 0, blue: 1.0, opacity: 0.2)
                  }.navigationBarTitle(Text("My To Do's"))
                .navigationBarItems(trailing: EditButton())
                .foregroundColor(.white)
           }
           //add a dark mode theme 
            .environment(\.colorScheme, .dark)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
       for index in offsets {
    let item = fetchedItems[index]
    managedObjectContext.delete(item)
        
        }
        do {
        try managedObjectContext.save()
        } catch {
           // print the Core Data error
            print(error.localizedDescription)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


