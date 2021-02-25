import SwiftUI

struct SFSymbols: View {
    var body: some View {
        // Using SF Symbols
        Image(systemName: "gear")
            .font(.system(size: 20, weight: .light))
        
        // Changing Scale
        Image(systemName: "gear")
            .imageScale(.large)
        
        // Multi Color
        Image(systemName: "paperplane.circle.fill")
            .renderingMode(.original)
    }
}

#if DEBUG
struct SFSymbols_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbols()
    }
}
#endif
