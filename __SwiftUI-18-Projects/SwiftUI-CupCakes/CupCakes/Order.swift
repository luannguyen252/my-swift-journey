//
//  Order.swift
//  CupCakes
//
//  Created by Sandesh on 06/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import Foundation
class Order: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case detail
    }
    
    struct Detail: Codable {
        var type = 0
        var quantity = 3
        
        var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        
        var extraFrosting = false
        var addSprinkles = false
        
        var name = ""
        var streetAddress = ""
        var city = ""
        var zip = ""
    }
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var detail = Detail()
    
    //placeholder initializer
    init() { }
    
    // encoding elements
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(detail, forKey: .detail)
    }
    
    //decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        detail = try container.decode(Detail.self, forKey: .detail)
    }
    
    
   
    var hasValidAddress: Bool {
        
        //Challenge 1: Check for all space address
        let nameTxt = detail.name.trimmingCharacters(in: .whitespaces)
        let streetAddressTxt = detail.streetAddress.trimmingCharacters(in: .whitespaces)
        let cityTxt = detail.city.trimmingCharacters(in: .whitespaces)
        let zipTxt = detail.zip.trimmingCharacters(in: .whitespaces)
        
        if nameTxt.isEmpty || streetAddressTxt.isEmpty || cityTxt.isEmpty || zipTxt.isEmpty {
            return false
        }
        return true
    }
    
    var cost: Double {
        var cost = Double(detail.quantity) * 2
        cost += (Double(detail.type)/2)
        if detail.extraFrosting {
            cost += Double(detail.quantity)
        }
        if detail.addSprinkles {
            cost += (Double(detail.quantity)/2)
        }
        
        return cost
    }
}
