//
//  ContentView.swift
//  ToDoApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// ROW HEIGHT
var rowHeight: CGFloat = 50

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", false), animation: .default)
    
    // Fetch To-Do Items
    var fetchedItems: FetchedResults<ToDoItem>
    
    // Task Title
    @State var newTaskTitle = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                // MARK: - TASKS
                ForEach(fetchedItems, id: \.self) { item in
                    HStack {
                        Text(item.taskTitle ?? "Empty")
                        
                        Spacer()
                        
                        Button(action: {
                            markTaskAsDone(at: fetchedItems.firstIndex(of: item)!)
                        }){
                            Image(systemName: "circle")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .frame(height: rowHeight)
                
                // MARK: - ADD TASK
                HStack {
                    TextField("Add Your Task...", text: $newTaskTitle, onCommit: {
                        saveTask()
                    })
                    Button(action: {
                        saveTask()
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                .frame(height: rowHeight)
                
                // MARK: - GO TO TASKS DONE SCREEN
                NavigationLink(destination: TasksDoneView()) {
                    Text("Tasks Done")
                        .frame(height: rowHeight)
                }
            } //: LIST
            .listStyle(GroupedListStyle())
            .navigationTitle("To-Do")
        } //: NAVIGATION VIEW
    }
    
    // MARK: - SAVE TASK
    func saveTask() {
        guard self.newTaskTitle != "" else {
            return
        }

        let newToDoItem = ToDoItem(context: viewContext)
        
        newToDoItem.taskTitle = newTaskTitle
        newToDoItem.createdAt = Date()
        newToDoItem.taskDone = false
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        newTaskTitle = ""
    }
    
    // MARK: - MARK TASK AS DONE
    func markTaskAsDone(at index: Int) {
        let item = fetchedItems[index]
        item.taskDone = true
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
#endif
