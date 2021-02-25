import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    @State var offset: CGFloat = 0
    @State var showCapsule = true
    
    var body: some View {
        GeometryReader { proxy in
            let rect = proxy.frame(in: .global)
            
            ScrollableTabBar(tabs: tabs, rect: rect, offset: $offset) {
                HStack(spacing: 0) {
                    ForEach(image_URLs.indices, id: \.self) { index in
                        WebImage(url: URL(string: image_URLs[index]))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width)
                            .cornerRadius(0) // Again bug so use cornerRadius
                            .overlay(Color("dark").opacity(0.0))
                    }
                }
                .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
        .overlay(
            // Tab Bar
            TabBar(offset: $offset, showCapsule: $showCapsule), alignment: .top
        )
        .overlay(
            // Enlarge Capsule Button
            Button(action: {
                withAnimation { showCapsule.toggle() }
            }, label: {
                Image(systemName: "fiberchannel")
                    .font(.title2)
                    .padding()
                    .background(Color("dark"))
                    .foregroundColor(Color("light"))
                    .clipShape(Circle())
            })
            .padding(), alignment: .bottomTrailing
        )
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif

var tabs = ["Home", "Voucher", "Account"]
