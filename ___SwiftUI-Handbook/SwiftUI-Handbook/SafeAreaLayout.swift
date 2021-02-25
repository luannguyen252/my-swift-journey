import SwiftUI

struct SafeAreaLayout: View {
    var body: some View {
        // Ignore Safe Area
        Color.blue.ignoresSafeArea()
        
        // Safe Area Edges
        Color.blue.ignoresSafeArea(.all, edges: .top)
        
        // Avoid Applying to Content
        ZStack {
            Color.blue.ignoresSafeArea()

            VStack {
                Text("SwiftUI for iOS 14")
                    .bold()
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
        }
    }
}

#if DEBUG
struct SafeAreaLayout_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaLayout()
    }
}
#endif
