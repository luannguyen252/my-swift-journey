import SwiftUI

struct HeaderComponent: View {
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
          Capsule()
            .frame(width: 120, height: 6)
            .foregroundColor(Color.secondary)
            .opacity(0.2)
          
          Image("logo-honeymoon")
            .resizable()
            .scaledToFit()
            .frame(height: 28)
        }
    }
}

// MARK: - PREVIEWS
#if DEBUG
struct HeaderComponent_Previews: PreviewProvider {
  static var previews: some View {
    HeaderComponent()
      .previewLayout(.fixed(width: 375, height: 128))
  }
}
#endif
