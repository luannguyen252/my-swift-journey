import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color("dark").ignoresSafeArea(.all, edges: .all)
            } else {  }
            
            VStack {
                VStack(spacing: 16) {
                    Text("Floating Action Button")
                        .font(.custom("TTFirsNeue-Bold", size: 32))
                        .foregroundColor(Color("light"))
                    
                    Text("SwiftUI Animations")
                        .font(.custom("TTFirsNeue-Regular", size: 24))
                        .foregroundColor(Color("dark4"))
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Spacer(minLength: 0)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    FloatingMenu()
                }
                .padding(16)
            }
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
