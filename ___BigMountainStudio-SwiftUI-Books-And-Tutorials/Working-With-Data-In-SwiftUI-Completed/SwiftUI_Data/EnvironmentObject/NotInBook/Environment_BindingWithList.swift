//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

// MARK: - DATA
class PersonData: ObservableObject {
    @Published var people = [
        Person(firstName: "Mark", lastName: "Moeykens"),
        Person(firstName: "Rod", lastName: "Liberal"),
        Person(firstName: "Lem", lastName: "Guerrero"),
        Person(firstName: "Chris", lastName: "Evans")]
}

// MARK: - FIRST VIEW
struct Environment_BindingWithList: View {
    @EnvironmentObject var personData: PersonData
    
    var body: some View {
        // Use Nav view so we can navigate back and forth
        NavigationView {
            List(personData.people) { person in
                // Pass in the selected person into the second view
                NavigationLink(destination: EditPersonView2(selectedPerson: person)) {
                    Text("\(person.firstName) \(person.lastName)")
                }
            }
            .navigationBarTitle("Editing Array Items")
        }
    }
}

// MARK: - SECOND VIEW
struct EditPersonView2: View {
    @EnvironmentObject var personData: PersonData // Automatically populated as long as a parent view somewhere up the hierarchy has it populated
    
    var selectedPerson: Person // Parameter passed in
    
    // Computed read-only property
    var selectedPersonId: Int {
        personData.people.firstIndex(where: { $0.id == selectedPerson.id })!
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("Edit and go back when done:")
                
                TextField("first name", text: $personData.people[selectedPersonId].firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("last name", text: $personData.people[selectedPersonId].lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - INITIALIZE FIRST VIEW WITH ENVIRONMENT OBJECT
struct Environment_BindingWithList_Previews: PreviewProvider {
    static var previews: some View {
        Environment_BindingWithList()
            .environmentObject(PersonData()) // Initialize the data so the view and all its subviews can access this data
    }
}
