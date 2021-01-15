//
//  QuickActionSettings.swift
//  QuickActionSwuiftUIBlog
//
//  Created by Thomas Prezioso on 11/3/20.
//

import Foundation

class QuickActionSettings: ObservableObject {
    
    enum QuickAction: Hashable {
        case home
        case details(name: String)
    }
    
    @Published var quickAction: QuickAction? = nil
}
