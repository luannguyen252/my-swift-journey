import SwiftUI

struct menuModel: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var destination: String
    var tag: Int
}

var menu = [
    menuModel(name: "Find a Match", icon: "suit.heart.fill", destination: "findAMatchView", tag: 0),
    menuModel(name: "Messages", icon: "message.fill", destination: "messagesView", tag: 1),
    menuModel(name: "Profile", icon: "person.fill", destination: "profileView", tag: 2)
]
