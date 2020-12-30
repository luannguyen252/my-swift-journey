/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A class that provides a sample set of contact data.
*/

import Foundation

struct ContactsData {

    // Shared access to the sample data.
    static var shared = ContactsData()

    // An sample set of contact data.
    var contacts = [
        Contact(name: "Nguyen Van A", email: "nguyen_van_a@example.com", favorite: false),
        Contact(name: "Nguyen Van B", email: "nguyen_van_b@example.com", favorite: false),
        Contact(name: "Nguyen Van C", email: "nguyen_van_c@example.com", favorite: false),
        Contact(name: "Nguyen Van D", email: "nguyen_van_d@example.com", favorite: false)
    ]

    // Returns all favorite contacts from the sample data.
    var favoriteContacts: [Contact] {
        return contacts.filter({ $0.favorite == true })
    }

    // Returns a contact that matches the input identifier.
    func contact(_ identifier: String) -> Contact? {
        let foundContact = contacts.filter({ $0.identifier == identifier })
        return foundContact[0]
    }
    
    // Updates the data model with the input contact.
    mutating func updateContact(_ contact: Contact) {
        let foundContact = contacts.filter({ $0.identifier == contact.identifier })
        if let index = contacts.firstIndex(of: foundContact[0]) {
            contacts[index] = contact
        }
    }
}
