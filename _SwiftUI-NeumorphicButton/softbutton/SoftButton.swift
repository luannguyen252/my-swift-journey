import SwiftUI

struct SoftButton: ButtonStyle {
    @State private var isPressed = false
    
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat = 30
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .contentShape(Rectangle())
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .foregroundColor(Color("Background"))
                            .cornerRadius(self.cornerRadius)
                            .shadow(color: Color("ShadowLight"), radius: 10, x: -6, y: -6)
                            .shadow(color: Color("ShadowDark"), radius: 10, x: 6, y: 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: self.cornerRadius)
                                    .stroke(Color("Background"), lineWidth: 4)
                                    .shadow(color: Color("ShadowDark"), radius: 8, x: 5, y: 5)
                                    .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                                    .shadow(color: Color("ShadowLight"), radius: 8, x: -2, y: -2)
                                    .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                            )
                            .blur(radius: 1)
                    } else {
                        Rectangle()
                            .foregroundColor(Color("Background"))
                            .cornerRadius(self.cornerRadius)
                            .shadow(color: Color("ShadowLight"), radius: 10, x: -6, y: -6)
                            .shadow(color: Color("ShadowDark"), radius: 10, x: 6, y: 6)
                            .blur(radius: 1)
                    }
                }
            )
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
            .animation(.spring())
    }
}
