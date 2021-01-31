import SwiftUI

struct CardView: View {
    var item: TodayItem
    // @Environment(\.colorScheme) var color
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            Image(item.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image" + item.id, in: animation)
                .frame(width: UIScreen.main.bounds.width - 24)
            
            HStack {
                Image(item.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 64)
                    .cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.custom("TTFirsNeue-Bold", size: 16))
                        .foregroundColor(Color("dark"))
                    Text(item.category)
                        .font(.custom("TTFirsNeue-Bold", size: 12))
                        .foregroundColor(Color("dark4"))
                }
                
                Spacer(minLength: 0)
                
                GetButtonView()
            }
            .matchedGeometryEffect(id: "content" + item.id, in: animation)
            .padding(.horizontal, 8)
            .padding(.top, 0)
            .padding(.bottom, 8)
        }
        .frame(height: 450)
        // .background(color == .dark ? Color("dark3") : Color("light"))
        .background(Color("light"))
        .cornerRadius(16)
    }
}
