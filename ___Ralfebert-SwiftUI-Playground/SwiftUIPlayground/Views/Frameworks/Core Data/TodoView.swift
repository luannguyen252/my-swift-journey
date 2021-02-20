// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import CoreData
import SwiftUI

struct TodoView: View {
    @ObservedObject var todo: Todo
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        Form {
            TextField("Todo", text: $todo.name ?? "")
        }
        .onDisappear {
            try? self.managedObjectContext.save()
        }
    }

}
