import SwiftUI

struct CreditsView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
          Image("compass")
            .resizable()
            .scaledToFit()
            .frame(width: 128, height: 128)
          
          Text("""
            Copyright © Luan Nguyen
            All right reserved
            Better Apps ♡ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
#endif
