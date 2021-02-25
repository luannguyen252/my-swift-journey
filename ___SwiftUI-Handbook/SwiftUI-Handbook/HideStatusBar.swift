import SwiftUI

struct HideStatusBar: View {
    var body: some View {
        // Hide Status Bar
        Text("Status bar")
            .statusBar(hidden: true)
    }
}

// Toggle Status Bar
struct ToggleStatusBar: View {
    @State var isHidden = false
    
    var body: some View {
        Text("Status bar")
            .statusBar(hidden: isHidden)
            .onTapGesture {
                withAnimation() {
                    isHidden = true
                }
            }
    }
}

#if DEBUG
struct HideStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        HideStatusBar()
    }
}
#endif
