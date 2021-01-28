//
//  MovieFilter.swift
//  BindingError-TV
//
//  Created by Daniel Saidi on 2020-11-12.
//

import SwiftUI
import SwiftUIKit

public class MovieFilter: ObservableObject {
    
    public init() {}
    
    @Published public var years: Years?
    @Published public var ratings: [Ratings] = []
    
    public struct Years: Identifiable {
        public var id: Int { from }
        public let from: Int
        public let to: Int?
    }
    
    public struct Ratings: Identifiable {
        public var id: Int { from }
        public let from: Int
        public let to: Int
    }
    
    public var ratingOptions: [Ratings] {
        [
            Ratings(from: 10, to: 10),
            Ratings(from: 9, to: 9),
            Ratings(from: 8, to: 8),
            Ratings(from: 7, to: 7),
            Ratings(from: 6, to: 6),
            Ratings(from: 5, to: 5),
            Ratings(from: 4, to: 4),
            Ratings(from: 3, to: 3),
            Ratings(from: 2, to: 2),
            Ratings(from: 1, to: 1),
            Ratings(from: 0, to: 0)
        ]
    }
    
    public var yearOptions: [Years] {
        [
            Years(from: 2020, to: nil),
            Years(from: 2010, to: 2020),
            Years(from: 2000, to: 2010),
            Years(from: 1990, to: 2000),
            Years(from: 1980, to: 1990),
            Years(from: 1970, to: 1980),
            Years(from: 1960, to: 1970),
            Years(from: 1950, to: 1960),
            Years(from: 1940, to: 1950),
            Years(from: 1930, to: 1940),
            Years(from: 1920, to: 1930),
            Years(from: 1910, to: 1920),
            Years(from: 1902, to: 1910)
        ]
    }
}

extension MovieFilter.Ratings: SimplePickerValue {
    
    public var displayName: String { "\(to)" }
}

extension MovieFilter.Years: SimplePickerValue {
    
    public var displayName: String { "\(from) - \(displayNameForTo)"}
    
    public var displayNameForTo: String {
        guard let to = to else { return "" }
        return "\(to)"
    }
}
