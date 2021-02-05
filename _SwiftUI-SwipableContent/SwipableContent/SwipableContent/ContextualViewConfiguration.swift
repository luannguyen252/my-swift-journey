//
//  ContextualViewConfiguration.swift
//  SwipableContent
//
//  Created by Sudarshan Sharma on 11/25/20.
//

import SwiftUI

public enum ContextualViewPosition {
    case leading, trailing
}

public class ContextualViewConfiguration: Equatable, Hashable, ObservableObject {
    
    // Action to be performed on tap
    var action: (() -> Void)?
    
    // Background color of contextual view
    let backgroundColor: Color
    
    // Width of contextual view
    @Published var contentWidth: CGFloat = 0.0
    
    // X offset of contextual view
    @Published var contentXOffset: CGFloat = 30.0
    
    // Image to be shown in contextual view
    var image: Image?
    
    // Text to be shown in contextual view
    var text: Text?
    
    let uuid = UUID()
    
    public init(text: Text? = nil, image: Image? = nil, backgroundColor: Color = .blue, _ action: (() -> Void)? = nil) {
        self.action = action
        self.image = image
        self.backgroundColor = backgroundColor
        self.text = text
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    public static func == (lhs: ContextualViewConfiguration, rhs: ContextualViewConfiguration) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public static func != (lhs: ContextualViewConfiguration, rhs: ContextualViewConfiguration) -> Bool {
        lhs.hashValue != rhs.hashValue
    }
}
