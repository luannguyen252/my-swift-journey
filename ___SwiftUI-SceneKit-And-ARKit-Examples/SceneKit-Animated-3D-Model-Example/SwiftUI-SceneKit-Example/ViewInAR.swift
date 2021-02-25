import SwiftUI

struct ViewInAR: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("View in AR")
                .font(.custom("TTFirsNeue-Bold", size: 32))
                .foregroundColor(Color("dark"))
            
            Text("View in AR screen is under construction.")
                .font(.custom("TTFirsNeue-Regular", size: 16))
                .foregroundColor(Color("dark4"))
        }
    }
}

#if DEBUG
struct ViewInAR_Previews: PreviewProvider {
    static var previews: some View {
        ViewInAR()
    }
}
#endif
