import SwiftUI

struct CategoryScreen: View {
    var body: some View {
        ZStack {
            Color("dark")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                HStack {
                    Text("Category")
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
struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
            .previewLayout(.sizeThatFits)
    }
}
#endif
