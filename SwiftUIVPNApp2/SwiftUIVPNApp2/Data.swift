//
//  Data.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct Data {
    static let regions = [
        Region(name: "Vietnam", imageName: "🇻🇳", strength: 4),
        Region(name: "USA", imageName: "🇺🇸", strength: 3),
        Region(name: "Australia", imageName: "🇦🇺", strength: 3),
        Region(name: "Canada", imageName: "🇨🇦", strength: 2),
        Region(name: "France", imageName: "🇫🇷", strength: 2)
    ]
    
    static let menus = [
        MenuItem(name: "Profile", imageName: "person.fill"),
        MenuItem(name: "Rate us", imageName: "star.fill"),
        MenuItem(name: "Support", imageName: "questionmark.circle.fill"),
        MenuItem(name: "Settings", imageName: "gearshape.fill"),
    ]
}
