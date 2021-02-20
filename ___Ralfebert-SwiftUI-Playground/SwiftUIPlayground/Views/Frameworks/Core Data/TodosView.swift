// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import CoreData
import SwiftUI

struct TodosView: View {
    @FetchRequest(fetchRequest: Todo.allTodos) var todos: FetchedResults<Todo>
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        NavigationView {
            List {
                ForEach(self.todos) { todo in
                    NavigationLink(destination: TodoView(todo: todo)) {
                        Text(todo.name ?? "")
                    }
                }
                .onDelete(perform: deleteRows)
            }
            .navigationBarTitle("Todos", displayMode: .inline)
            .navigationBarItems(trailing: addButton)
        }
    }

    func deleteRows(at offsets: IndexSet) {
        for index in offsets {
            self.managedObjectContext.delete(self.todos[index])
        }
    }

    var addButton: some View {
        Button(
            action: {
                let todo = Todo.create(in: self.managedObjectContext)
                todo.name = "Example \(Date())"
                try! self.managedObjectContext.save()
            },
            label: {
                Image(systemName: "plus")
            }
        )
    }

}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView()
            .environment(\.managedObjectContext, CoreDataStack.shared.persistentContainer.viewContext)
    }
}
