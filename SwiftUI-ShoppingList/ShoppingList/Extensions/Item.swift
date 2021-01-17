import SwiftUI

extension Item: OrderableManagedObjectProtocol {}

extension Item {
    var checkbox: String {
        isComplete ? "checkmark.square.fill" : "square"
    }
    
    var checkboxColor: Color {
        isComplete ? .green : .secondary
    }
}
