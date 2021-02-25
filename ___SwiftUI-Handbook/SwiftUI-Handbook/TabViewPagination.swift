import SwiftUI

struct TabViewPagination: View {
    var body: some View {
        // Tab View with Page Style
        TabView {
            RoundedRectangle(cornerRadius: 30).padding()
            RoundedRectangle(cornerRadius: 30).padding()
            RoundedRectangle(cornerRadius: 30).padding()
        }
        .tabViewStyle(PageTabViewStyle())
        
        // Show or Hide Dots
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        
        // Final Code
        TabView {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.blue)
                .padding()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.red)
                .padding()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.purple)
                .padding()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#if DEBUG
struct TabViewPagination_Previews: PreviewProvider {
    static var previews: some View {
        TabViewPagination()
    }
}
#endif
