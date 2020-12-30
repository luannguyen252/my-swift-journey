/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model class used to represent basic contact information for a person.
*/

import Foundation

struct Contact: Hashable, Codable {
    var name: String
    var email: String
    var favorite: Bool
    var identifier: String
    
    // MARK: - Object life cycle

    init(name: String, email: String, favorite: Bool) {
        self.name = name
        self.email = email
        self.favorite = favorite
        self.identifier = UUID().uuidString
    }

}

/// Adds a property containing a contact represented as a Home Screen quick action compatible userInfo dictionary.
extension Contact {

    /// - Tag: QuickActionUserInfo
    var quickActionUserInfo: [String: NSSecureCoding] {
        /** Encode the name of the contact into the userInfo dictionary so it can be passed
            back when a quick action is triggered. Note: In the real world, it's more appropriate
            to encode a unique identifier for the contact than for the name.
        */
        return [ SceneDelegate.favoriteIdentifierInfoKey: self.identifier as NSSecureCoding ]
    }

}
