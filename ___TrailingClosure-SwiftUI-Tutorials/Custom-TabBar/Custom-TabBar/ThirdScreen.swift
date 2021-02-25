import SwiftUI

struct ThirdScreen: View {
    var body: some View {
        ZStack {
            Color("dark").opacity(0.02).ignoresSafeArea(.all, edges: .all)
            
            Text("Third")
                .font(.custom("TTFirsNeue-Bold", size: 24))
                .foregroundColor(Color("dark"))
        }
    }
}

#if DEBUG
struct ThirdScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreen()
    }
}
#endif
