//
//  Data.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import Foundation

struct Data {
    static let menus = [
        MenuItem(name: "Hot"),
        MenuItem(name: "Selling"),
        MenuItem(name: "Pre-sale")
    ]
    
    static let shoes = [
        ShoeItem(name: "Nike Air Zoom Pegasus 37", image: "pegasus_37", price: 250, availableSize: [5.5, 6.0, 7.0, 8.0, 9.5, 10]),
        ShoeItem(name: "Nike Air Zoom Structure 23", image: "structure_23", price: 300, availableSize: [5.5, 6.0, 8.0, 9.5, 10]),
        ShoeItem(name: "Nike React Infinity Run Flyknit", image: "infinity_run", price: 280, availableSize: [7.0, 8.0, 9.5, 10]),
        ShoeItem(name: "Nike Air Zoom Terra Kiger 6", image: "terra_kiger_6", price: 170, availableSize: [5.5, 7.0, 8.0, 10]),
        ShoeItem(name: "Nike Air Zoom vomero 14", image: "vomero_14", price: 120, availableSize: [5.5, 6.0, 7.0, 8.0, 9.5]),
        ShoeItem(name: "Nike Wildhorse 6", image: "wildhorse_6", price: 200, availableSize: [5.5, 6.0, 7.0, 8.0, 9.5, 10.0]),
        ShoeItem(name: "Nike React Phantom Run Flyknit 2", image: "phantom_2", price: 220, availableSize: [6.0, 9.5, 10.0])
    ]
    
    static let shoeSizes = [5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 9.0, 9.5, 10.0]
    
    static func getShoeSizeText(size: Double) -> String {
        switch size {
        case 5.5:
            return "UK 5.5"
        case 6.0:
            return "UK 6"
        case 6.5:
            return "UK 6.5"
        case 7.0:
            return "UK 7"
        case 7.5:
            return "UK 7.5"
        case 8.0:
            return "UK 8"
        case 9.0:
            return "UK 9"
        case 9.5:
            return "UK 9.5"
        case 10.0:
            return "UK 10"
        default:
            return "UK 5.5"
        }
    }
}
