// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var subscribed: Bool
    var birthday: Date

    static let alice = Contact(name: "Alice", subscribed: false, birthday: Date(year: 1970, month: 7, day: 8))

    static let bob = Contact(name: "Bob", subscribed: true, birthday: Date(year: 1980, month: 3, day: 4))
}

struct ContactFormView: View {

    @State var contact = Contact.bob

    var body: some View {
        Form {
            Section(header: Text("Personal information")) {
                HStack {
                    Text("Name")
                    TextField("Username", text: $contact.name)
                        .multilineTextAlignment(.trailing)
                }
                Toggle(isOn: $contact.subscribed) {
                    Text("Subscribed")
                }
                DatePicker(selection: $contact.birthday, label: { Text("Birthday") })
            }

            PickerExampleView()

        }
        .navigationBarTitle("Contact")
    }

}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactFormView()
        }
    }
}
