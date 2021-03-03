import SwiftUI

struct FormRowLinkView: View {
  // MARK: - PROPERTIES
  var icon: String
  var color: Color
  var text: String
  var link: String
  
  // MARK: - BODY
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(color)
        Image(systemName: icon)
          .imageScale(.large)
          .foregroundColor(Color.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(text).foregroundColor(Color.gray)
      
      Spacer()
      
      Button(action: {
        // OPEN A LINK
        guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else {
          return
        }
        UIApplication.shared.open(url as URL)
      }) {
        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold, design: .rounded))
      }
      .accentColor(Color(.systemGray2))
    }
  }
}

// MARK: - PREVIEW
#if DEBUG
struct FormRowLinkView_Previews: PreviewProvider {
  static var previews: some View {
    FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://luannguyen.design")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
#endif
