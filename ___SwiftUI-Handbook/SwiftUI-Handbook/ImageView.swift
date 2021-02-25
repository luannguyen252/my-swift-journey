import SwiftUI

struct ImageView: View {
    var body: some View {
        // Image View
        Image("mac1")
        
        // Resizing the Image
        Image("mac1")
            .resizable()
        
        // Aspect Ratio
        Image("mac1")
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        // Frame Alignment
        Image("mac1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200, alignment: .center)
        
        // Tile an Image
        Image("mac1")
            .resizable(resizingMode: .tile)
            .aspectRatio(contentMode: .fit)
    }
}

#if DEBUG
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
#endif
