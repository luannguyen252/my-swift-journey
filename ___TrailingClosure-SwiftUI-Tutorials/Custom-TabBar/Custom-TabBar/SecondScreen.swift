import SwiftUI

struct SecondScreen: View {
    var body: some View {
        ZStack {
            Color("dark").opacity(0.02).ignoresSafeArea(.all, edges: .all)
            
            Text("Second")
                .font(.custom("TTFirsNeue-Bold", size: 24))
                .foregroundColor(Color("dark"))
        }
    }
}

#if DEBUG
struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
#endif
