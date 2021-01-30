import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("dark2"))
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                Circle()
                    .stroke(Color("pink2"), lineWidth: 2)
                    .frame(width: 40, height: 40)
                VStack(spacing: 4) {
                    Text("Luan Nguyen")
                        .font(.custom("TTFirsNeue-Bold", size: 18))
                        .foregroundColor(Color("light"))
                    Text("UX Engineer")
                        .foregroundColor(Color("dark3"))
                }
                .padding(.bottom, 16)
                Capsule()
                    .fill(Color("pink2"))
                    .frame(height: 40)
                    .overlay(Text("Contact Me").font(.custom("TTFirsNeue-Bold", size: 16)))
            }
            .padding(16)
            .frame(width: 300, height: 200)
            .background(Color("dark"))
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
