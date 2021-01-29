import SwiftUI

struct Home: View {
    // For Search Bar
    @Binding var filteredItems : [AppItem]
    
    var body: some View {
        // Apps List View
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                // Apps List
                ForEach(filteredItems) { item in
                    // Card View
                    CardView(item: item)
                }
            }
            .padding()
        }
    }
}
