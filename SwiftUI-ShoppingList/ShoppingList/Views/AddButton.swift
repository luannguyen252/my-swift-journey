import SwiftUI

struct AddButton: View {
    
    // MARK: Type aliases
    
    typealias Action = () -> Void
    
    // MARK: Public properties
    
    var showAddField: Bool
    
    var action: Action
    
    // MARK: Initializers
    
    init(_ showAddField: Bool, action: @escaping Action) {
        self.showAddField = showAddField
        self.action = action
    }
    
    // MARK: Render
    
    var body: some View {
        Button(action: action) {
            if showAddField {
                Text("Cancel")
            } else {
                Image(systemName: "plus")
            }
        }
    }
}

// MARK: Preview

#if DEBUG
struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(false) {}
    }
}
#endif
