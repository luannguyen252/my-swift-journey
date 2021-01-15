//
//  Binding+Utilities.swift
//  SwiftUISurvey
//
//  Created by Amir Khorsandi on 22/12/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI

extension Binding {
    static func fake(_ value: Value) -> Binding<Value> {
        .init(get: { value }, set: { _ in })
    }
}

extension Binding where Value == Question? {
    func isNilBinding() -> Binding<Bool> {
        Binding<Bool>.init(get: {
            self.wrappedValue != nil
        }, set: {
            if $0 == false { 
                self.wrappedValue = nil
            }
        })
    }
}
