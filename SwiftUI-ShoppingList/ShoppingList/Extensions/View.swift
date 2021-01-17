import SwiftUI
import CoreData

extension View {
    static var listFetchRequest: NSFetchRequest<Item> {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "order", ascending: true)]
          
        return request
    }
}
