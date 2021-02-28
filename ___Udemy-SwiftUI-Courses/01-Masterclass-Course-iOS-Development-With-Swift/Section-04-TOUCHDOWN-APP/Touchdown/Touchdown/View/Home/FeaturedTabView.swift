import SwiftUI

struct FeaturedTabView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.vertical, 0)
                    .padding(.horizontal, 15)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 200)
    }
}

// MARK: - PREVIEWS
#if DEBUG
struct FeaturedTabView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedTabView()
      .previewDevice("iPhone 12 Pro")
      .background(Color.gray)
  }
}
#endif
