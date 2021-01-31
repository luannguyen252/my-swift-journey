import SwiftUI

struct SavedScreen: View {
    var body: some View {
        ZStack {
            Color("dark")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                HStack {
                    Text("Saved")
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
struct SavedScreen_Previews: PreviewProvider {
    static var previews: some View {
        SavedScreen()
            .previewLayout(.sizeThatFits)
    }
}
#endif
