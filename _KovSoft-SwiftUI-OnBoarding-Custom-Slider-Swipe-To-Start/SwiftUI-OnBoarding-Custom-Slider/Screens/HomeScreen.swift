import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            Color("dark")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                HStack(alignment: .center) {
                    Text("Home")
                        .font(.custom("TTFirsNeue-Bold", size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("light"))
                    
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Spacer(minLength: 0)
            }
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewLayout(.sizeThatFits)
    }
}
#endif
