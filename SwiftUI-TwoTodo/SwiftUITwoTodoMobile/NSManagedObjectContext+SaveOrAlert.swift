import CoreData
import SwiftUI

extension NSManagedObjectContext {
    func saveOrAlert(message: Binding<AlertMessage?>) {
        do {
            try save()
        } catch {
            let nsError = error as NSError
            message.wrappedValue = AlertMessage(
                message: "Unresolved error \(nsError), \(nsError.userInfo). The program will terminate."
            )
        }
    }
}

enum TestError: Error {
    case test
}
