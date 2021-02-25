import SwiftUI

struct ClipShapeAndSmoothCorners: View {
    var body: some View {
        // Card with Rounded Corners
        ZStack {
            Color.blue.ignoresSafeArea()

            VStack {
                Text("SwiftUI for iOS 14")
                    .bold()
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
        }
        
        // Clip Shape Circle
        .clipShape(Circle())
        
        // Corner Radius Style Continuous
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        
        // Final Code
        ZStack {
            Color.blue.ignoresSafeArea()

            VStack {
                Text("SwiftUI for iOS 14")
                    .bold()
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        }
    }
}

#if DEBUG
struct ClipShapeAndSmoothCorners_Previews: PreviewProvider {
    static var previews: some View {
        ClipShapeAndSmoothCorners()
    }
}
#endif
