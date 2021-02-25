import SwiftUI

struct FirstScreen: View {
    var body: some View {
        ZStack {
            Color("dark").opacity(0.02).ignoresSafeArea(.all, edges: .all)
            
            Text("First Screen")
                .font(.custom("TTFirsNeue-Bold", size: 24))
                .foregroundColor(Color("dark"))
        }
    }
}

#if DEBUG
struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
#endif
