import SwiftUI
import CoreData

protocol OrderableManagedObjectProtocol: AnyObject {
    var order: Int32 {get set}
}

extension FetchedResults where Result: NSManagedObject {
    func delete(_ managedObjectContext: NSManagedObjectContext) -> (IndexSet) -> Void {
        func delete(_ offset: IndexSet) {
            var arr = Array(self)
            arr.remove(atOffsets: offset)
            
            let diff = arr.difference(from: self)
            for change in diff {
                switch change {
                case let .remove(_, element, _):
                    managedObjectContext.delete(element)
                    try? managedObjectContext.save()
                case .insert(_, _, _):
                    print("nothing")
                }
            }
        }
        
        return delete
    }
}

extension FetchedResults where Result: OrderableManagedObjectProtocol {
    func move(_ managedObjectContext: NSManagedObjectContext) -> (IndexSet, Int) -> Void {
        func move(_ offset: IndexSet, _ destination: Int) {
            managedObjectContext.perform {
                var arr = Array(self)
                arr.move(fromOffsets: offset, toOffset: destination)
                for i in 0..<arr.count {
                    arr[i].order = Int32(i)
                }
                try? managedObjectContext.save()
            }
        }
        
        return move
    }
}
