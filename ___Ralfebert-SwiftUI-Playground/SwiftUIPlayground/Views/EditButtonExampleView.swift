// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct EditButtonExampleView: View {

    @State var names = ["Alice", "Bob", "Carol"]

    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
            .onDelete(perform: delete)
        }
        .navigationBarTitle("Names")
        .navigationBarItems(trailing: EditButton())
    }

    func delete(at offsets: IndexSet) {
        self.names.remove(atOffsets: offsets)
    }

}

struct EditButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonExampleView()
    }
}
