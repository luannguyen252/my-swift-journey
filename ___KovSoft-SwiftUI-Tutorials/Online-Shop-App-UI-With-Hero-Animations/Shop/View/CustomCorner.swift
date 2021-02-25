//
//  CustomCorner.swift
//  Shop
//
//  Created by Balaji on 05/10/20.
//

import SwiftUI

struct CustomCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
