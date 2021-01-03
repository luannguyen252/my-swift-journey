//
//  TasksDoneView.swift
//  ToDoApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct TasksDoneView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", true), animation: .default)
    
    var fetchedItems: FetchedResults<ToDoItem>
    
    // MARK: - BODY
    var body: some View {
        List {
            ForEach(fetchedItems, id: \.self) { item in
                HStack {
                    Text(item.taskTitle ?? "Empty")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
                    .frame(height: rowHeight)
            }
            .onDelete(perform: removeItems)
        } //: LIST
        .navigationBarTitle(Text("Tasks Done"))
        .navigationBarItems(trailing: EditButton())
        .listStyle(GroupedListStyle())
    }
    
    // MARK: - REMOVE ITEMS
    private func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let item = fetchedItems[index]
            viewContext.delete(item)
        }
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct TasksDoneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TasksDoneView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
#endif
