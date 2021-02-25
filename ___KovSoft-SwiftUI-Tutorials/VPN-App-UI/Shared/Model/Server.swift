//
//  Server.swift
//  VPN (iOS)
//
//  Created by Balaji on 22/12/20.
//

// Server Model And Model Data....

import SwiftUI

struct Server: Identifiable {

    var id = UUID().uuidString
    var name: String
    var flag: String
    
}

var servers = [
    
    Server(name: "United States", flag: "us"),
    Server(name: "India", flag: "in"),
    Server(name: "United Kingdom", flag: "uk"),
    Server(name: "France", flag: "fr"),
    Server(name: "Germany", flag: "ge"),
    Server(name: "Singapore", flag: "si"),
]

