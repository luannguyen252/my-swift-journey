//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct BindingWithLazyVStack: View {
    @State private var people = [
        Person(firstName: "Mark", lastName: "Moeykens"),
        Person(firstName: "Rod", lastName: "Liberal"),
        Person(firstName: "Chris", lastName: "Durtschi"),
        Person(firstName: "Chase", lastName: "Blumenthal")]
    @State private var selectedPersonId: UUID?
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        HeaderView("", subtitle: "Binding With LazyVStack", desc: "You want to bind the array and an index for a two-way bind.", back: .yellow)

                        ForEach(people) { person in
                            HStack {
                                Text("\(person.firstName + " " + person.lastName)")
                                Spacer()
                                Image(systemName: "pencil.circle")
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .onTapGesture {
                                selectedPersonId = person.id
                            }
                        }
                    }
                }
                
                if let id = selectedPersonId {
                    EditPersonPopupView(person: $people[people.firstIndex(where: { $0.id == id })!], id: $selectedPersonId)
                }
            }
            .font(.title)
            .navigationTitle("LazyVStack: Editing")
        }
    }
}

struct EditPersonPopupView: View {
    @Binding var person: Person
    @Binding var id: UUID!
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Edit Name")
                .font(.largeTitle)
            
            TextField("first name", text: $person.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("last name", text: $person.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                id = nil
            }, label: {
                Text("Close")
            })
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 8))
        .padding(24)
    }
}

struct BindingWithLazyVStack_Previews: PreviewProvider {
    static var previews: some View {
        BindingWithLazyVStack()
            .preferredColorScheme(.light)
    }
}
