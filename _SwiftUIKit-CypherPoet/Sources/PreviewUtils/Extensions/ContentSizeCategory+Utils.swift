#if DEBUG

import SwiftUI


extension ContentSizeCategory {
    public static let smallestAndLargest = [allCases.first!, allCases.last!]


    public var previewName: String {
        if self == Self.smallestAndLargest.first {
            return "Smallest"
        }

        if self == Self.smallestAndLargest.last {
            return "Largest"
        }

        return String(describing: self)
    }
}

#endif
