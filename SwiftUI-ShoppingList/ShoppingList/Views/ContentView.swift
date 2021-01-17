import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: Environment properties
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @EnvironmentObject var manager: ListManager
    
    // MARK: State properties
    
    @State private var text = ""
    
    @State private var notes = ""

    @State private var isAdding = false {
        didSet {
            if !isAdding {
                self.text = ""
                self.notes = ""
            }
        }
    }
    
    // MARK: CoreData properties

    @FetchRequest(fetchRequest: listFetchRequest) var items: FetchedResults<Item>
    
    // MARK: Private methods

    private func toggleAdding() {
        isAdding.toggle()
    }
    
    private func save() {
        manager.add(text, count: items.count, notes: notes.isEmpty ? nil : notes)
        isAdding = false
    }

    // MARK: Render
    
    var body: some View {
        NavigationView {
            Form {
                if isAdding {
                    Section(header: Text("Add an Item")) {
                        TextField("Title", text: $text, onCommit: save)
                        TextField("Notes", text: $notes, onCommit: save)
                    }
                }
                Section {
                    ForEach(items, id: \.objectID) {
                        Cell(item: $0)
                    }
                    .onDelete(perform: items.delete(managedObjectContext))
                    .onMove(perform: items.move(managedObjectContext))
                }
            }
            .navigationBarTitle("My List")
            .navigationBarItems(leading: EditButton(),
                                trailing: AddButton(isAdding,
                                                    action: toggleAdding))
        }
    }
}

// MARK: Preview

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
