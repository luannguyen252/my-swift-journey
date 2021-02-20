// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ListExampleView: View {

    var names = ["Alice", "Bob"]

    struct Person {
        var name: String
    }

    var personArray = [Person(name: "Alice"), Person(name: "Bob")]

    var contactsArray = [Contact.alice, Contact.bob]

    var body: some View {
        Group {
            NavigationLink("List of Views", destination:
                List {
                    Text("Alice")
                    Text("Bob")
                })
            NavigationLink("List of Array of simple values", destination:
                List(names, id: \.self) { name in
                    Text(name)
                })
            NavigationLink("List of Array", destination:
                List(personArray, id: \.name) { person in
                    Text(person.name)
                })
            NavigationLink("List of Array with Identifiable objects", destination:
                List(contactsArray) { contact in
                    Text(contact.name)
                })
            NavigationLink("Editable List with Binding", destination:
                EditableListExample())
        }
    }
}

struct ListExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Form {
                ListExampleView()
            }
        }
    }
}
