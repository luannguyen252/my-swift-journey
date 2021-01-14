import SwiftUI

struct ItemForm: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    @Binding var alertMessage: AlertMessage?
    @State private var title = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
                Section {
                    Button {
                        let newItem = Item(context: viewContext)
                        newItem.timestamp = Date()
                        newItem.isChecked = false
                        newItem.title = title

                        viewContext.saveOrAlert(message: $alertMessage)
                        presentationMode.wrappedValue.dismiss()
                    } label: { Text("Save") }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: { Text("Close") }
                }
            }
            .navigationTitle("Add new TODO")
        }
    }
}

#if DEBUG
struct ItemForm_Previews: PreviewProvider {
    static var previews: some View {
        ItemForm(alertMessage: .preview)
    }
}
#endif
