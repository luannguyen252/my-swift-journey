//
//  Foundation+Extensions.swift
//  COVID-19
//
//  Created by michael.chan on 27/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import Foundation

extension String {
    
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
