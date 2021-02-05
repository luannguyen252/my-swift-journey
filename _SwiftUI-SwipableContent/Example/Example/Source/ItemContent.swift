//
//  ItemContent.swift
//  Example
//
//  Created by Sudarshan Sharma on 11/26/20.
//

import SwiftUI
import SwipableContent

struct RowContent {
    var configurations: [ContextualViewConfiguration]?
    let description: String
    let systemImageName: String
    let text: String
    
    init(text: String, systemImageName: String, description: String, configurations: [ContextualViewConfiguration]? = nil) {
        self.text = text
        self.systemImageName = systemImageName
        self.description = description
        self.configurations = configurations
    }
}
