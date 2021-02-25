import SwiftUI

struct HeaderView: View {
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "swift")
                .font(.system(size: 32))
                .foregroundColor(Color(scheme == .dark ? "pink2" : "orange"))
            
            Text("SwiftUI")
                .font(.custom("TTFirsNeue-Bold", size: 18))
                .foregroundColor(Color(scheme == .dark ? "light" : "dark"))
                .kerning(0.5) /// Word spacing
                .offset(x: -10)
            
            Spacer(minLength: 0)
            
            Button(action: {
                print("Profile is pressed.")
            }, label: {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background((scheme == .dark ? Color("dark") : Color("white")).ignoresSafeArea(.all, edges: .top))
        /// Divider
        .overlay(
            Divider(), alignment: .bottom
        )
    }
}

#if DEBUG
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
#endif
