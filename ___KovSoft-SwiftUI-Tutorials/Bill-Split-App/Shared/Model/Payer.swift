//
//  Payer.swift
//  Split (iOS)
//
//  Created by Balaji on 26/12/20.
//

import SwiftUI

// Sample Model And Data....

struct Payer: Identifiable {
    
    var id = UUID().uuidString
    var image: String
    var name: String
    var bgColor: Color
    
    // Offset For Custom Progress View....
    var offset: CGFloat = 0
}
