

import Foundation

struct MenuModel: Identifiable {
    var id = UUID()
    var icon: String
    var name: String
}

var Menu = [
    MenuModel(icon: "square.grid.2x2.fill", name: "Dashboard"),
    MenuModel(icon: "message.fill", name: "Messages"),
    MenuModel(icon: "bell.fill", name: "Notification"),
    MenuModel(icon: "heart.fill", name: "Favourites"),
    MenuModel(icon: "person.fill", name: "My Profile"),
]


