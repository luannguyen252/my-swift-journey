import Foundation

struct Counter {
    var value: Int = 0
    var isPremium: Bool = false
    
    mutating func increment() {
        value += 1
        
        // Business logic
        if value.isMultiple(of: 3) {
            // Premium
            isPremium = true
        } else {
            // Not Premium
            isPremium = false
        }
    }
}
