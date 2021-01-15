//
//  RandomAccessCollection.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation

// https://medium.com/better-programming/meet-greet-list-pagination-in-swiftui-8330ee15fd61
extension RandomAccessCollection where Self.Element: Identifiable {
    func isLastItem(_ item: Self.Element) -> Bool {
        guard !isEmpty else {
            return false
        }
        
        guard let index = firstIndex(where: { $0.id == item.id }) else {
            return false
        }
        
        return distance(from: index, to: endIndex) == 1
    }
}
