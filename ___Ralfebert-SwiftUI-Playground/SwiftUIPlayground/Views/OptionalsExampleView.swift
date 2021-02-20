// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct Person {
    var name: String
}

struct OptionalsExampleView: View {

    var person: Person? = Person(name: "Bob")
    var userStatus: Status = .loggedIn

    var body: some View {
        VStack {
            if let person = person {
                VStack {
                    Text("Name:")
                    Text(person.name)
                }
            } else {
                Text("No person available")
            }
        }

    }

}

struct OptionalsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OptionalsExampleView()
        }
    }
}
