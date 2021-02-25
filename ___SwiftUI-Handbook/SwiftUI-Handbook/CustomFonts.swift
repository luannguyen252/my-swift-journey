import SwiftUI

struct CustomFonts: View {
    var body: some View {
        Text("Hello, TTFirsNeue Bold")
            .font(.custom("TTFirsNeue-Bold", size: 34))
        
        Text("Hello, TTFirsNeue DemiBold")
            .font(.custom("TTFirsNeue-DemiBold", size: 34))
        
        Text("Hello, TTFirsNeue Regular")
            .font(.custom("TTFirsNeue-Regular", size: 34))
    }
}

#if DEBUG
struct CustomFonts_Previews: PreviewProvider {
    static var previews: some View {
        CustomFonts()
    }
}
#endif
