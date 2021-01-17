import SwiftUI

struct Cell: View {
    
    // MARK: Environment properties
    
    @EnvironmentObject var manager: ListManager
    
    // MARK: Observed objects
    
    @ObservedObject var item: Item

    // MARK: Render
    
    var body: some View {
        Button(action: manager.toggleComplete(item)) {
            HStack {
                Image(systemName: item.checkbox)
                    .foregroundColor(item.checkboxColor)
                VStack(alignment: .leading) {
                    Text(item.title ?? "")
                        .font(.headline)
                        .foregroundColor(.primary)
                    if item.notes != nil {
                        Text(item.notes ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

// MARK: Preview

#if DEBUG
struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(item: Item())
    }
}
#endif
