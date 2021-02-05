//
//  ContextualViewPreferenceKey.swift
//  SwipableContent
//
//  Created by Sudarshan Sharma on 11/25/20.
//

import SwiftUI

public class TrailingContextualViewPreferenceKey: PreferenceKey {
    public typealias Value = [ContextualViewConfiguration]?
    
    public static var defaultValue: [ContextualViewConfiguration]?
    
    public static func reduce(value: inout Value, nextValue: () -> Value) {
        if let next = nextValue() {
            value = next
        }
    }
}

public class LeadingContextualViewPreferenceKey: PreferenceKey {
    public typealias Value = [ContextualViewConfiguration]?
    
    public static var defaultValue: [ContextualViewConfiguration]?
    
    public static func reduce(value: inout Value, nextValue: () -> Value) {
        if let next = nextValue() {
            value = next
        }
    }
}
