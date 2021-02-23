//
//  Extension.swift
//  Clima
//
//  Created by mohammad mugish on 28/01/21.
//

import Foundation

extension Date {
    
    func get(_ type: Calendar.Component)-> String {
        let calendar = Calendar.current
        let t = calendar.component(type, from: self)
        return (t < 10 ? "0\(t)" : t.description)
    }
}
