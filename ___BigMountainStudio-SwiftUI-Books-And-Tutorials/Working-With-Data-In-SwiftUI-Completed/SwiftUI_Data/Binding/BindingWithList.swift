//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var firstName = ""
    var lastName = ""
}

struct BindingWithList: View {
    @State private var people = [
        Person(firstName: "Mark", lastName: "Moeykens"),
        Person(firstName: "Lem", lastName: "Guerrero"),
        Person(firstName: "Chris", lastName: "Evans")]
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView("", subtitle: "Binding With List", desc: "You want to bind the array and an index for a two-way bind.", back: .yellow)
                List(people) { person in
                    NavigationLink(destination: EditPersonView(person: $people[people.firstIndex(where: { $0.id == person.id })!])) {
                        Text("\(person.firstName + " " + person.lastName)")
                            .font(.title)
                    }
                }
                .navigationTitle("Editing Array Items")
            }
            .font(.title)
        }
    }
}

struct EditPersonView: View {
    @Binding var person: Person // Binding will complete the 2-way connection between this and the parent view
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("Edit and go back when done:")
                
                TextField("first name", text: $person.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("last name", text: $person.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }
        .font(.title)
        .navigationTitle("Edit Name")
    }
}

struct BindingWithList_Previews: PreviewProvider {
    static var previews: some View {
        BindingWithList()
    }
}
