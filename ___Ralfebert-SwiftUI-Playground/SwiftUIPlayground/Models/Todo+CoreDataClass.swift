// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import CoreData
import Foundation

@objc(Todo)
public class Todo: NSManagedObject {

    static var allTodos: NSFetchRequest<Todo> {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return request
    }

    static func create(in ctx: NSManagedObjectContext) -> Todo {
        NSEntityDescription.insertNewObject(forEntityName: "Todo", into: ctx) as! Todo
    }

}
