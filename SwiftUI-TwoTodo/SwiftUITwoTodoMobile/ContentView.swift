//
//  ContentView.swift
//  SwiftUITwoTodoMobile
//
//  Created by Renaud JENNY on 30/09/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @State private var isAddItemPresented = false
    @State private var alertMessage: AlertMessage?

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    if let title = item.title, let timestamp = item.timestamp, let isChecked = item.isChecked {
                        Button {
                            check(item: item)
                        } label: {
                            Label(
                                "\(title) \(timestamp, formatter: itemFormatter)",
                                systemImage: isChecked ? "checkmark.circle" : "circle"
                            )
                        }
                    } else {
                        Text("ERROR: Cannot display item")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle(Text("SwiftUI 2 Todo"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddItemPresented = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddItemPresented) {
                ItemForm(alertMessage: $alertMessage)
            }
            .alert(item: $alertMessage, content: showAlert)
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            viewContext.saveOrAlert(message: $alertMessage)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            viewContext.saveOrAlert(message: $alertMessage)
        }
    }

    private func check(item: Item) {
        item.isChecked.toggle()
        viewContext.saveOrAlert(message: $alertMessage)
    }

    private func showAlert(alertMessage: AlertMessage) -> Alert {
        Alert(title: Text("Something went wrong..."), message: Text(alertMessage.message), dismissButton: .cancel({
            fatalError("Unresolved error")
        }))
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// TODO: move AlertMessage and extension into their own file
struct AlertMessage: Identifiable {
    var message: String
    var id: String { message }
}

#if DEBUG
extension Binding where Value == AlertMessage? {
    static var preview: Self { .constant(AlertMessage(message: "Preview")) }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
#endif
