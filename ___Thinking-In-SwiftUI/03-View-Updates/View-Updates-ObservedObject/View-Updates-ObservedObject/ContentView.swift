import SwiftUI

struct ContentView: View {
    @State var selection: Contact?
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ForEach(contacts) { contact in
                    Button(contact.name) {
                        self.selection = contact
                    }
                }
            }
            
            if let c = selection {
                Detail(contact: c)
            }
        }
    }
}

/*
 Note that if we would have used Detail in a different context (for example,
 within a navigation link), we could have defined the property using @StateObject instead,
 but only if we could guarantee that the reference would never change.
 */
// Define contact using @ObservedObject
struct Detail: View {
    @ObservedObject var contact: Contact
    
    var body: some View {
        VStack {
            Text(contact.name)
                .font(.system(size: 18, weight: .heavy, design: .default))
                .foregroundColor(Color("dark"))
            Text(contact.city)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(Color("dark4"))
        }
    }
}

// ObservedObject
final class Contact: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var city: String
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

// Contacts Data
var contacts = [
    Contact(name: "Luan Nguyen", city: "Hanoi"),
    Contact(name: "Steve Jobs", city: "San Francisco"),
    Contact(name: "Tim Cook", city: "Florida"),
]

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
