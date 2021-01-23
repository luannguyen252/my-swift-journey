import SwiftUI

struct SoftSwitch: ToggleStyle {
    var width: CGFloat = 50
    
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack(alignment: configuration.isOn ? .trailing : .leading) {
            Button(action: {
                playHaptic()
                configuration.isOn.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: width/3, style: .circular)
                    .frame(width: width, height: width/2)
                    .foregroundColor(Color("Background"))
                    .overlay(
                        RoundedRectangle(cornerRadius: width/3)
                            .stroke(Color("Background"), lineWidth: 4)
                            .shadow(color: Color("ShadowDark"), radius: 3, x: 3, y: 3)
                            .clipShape(RoundedRectangle(cornerRadius: width/3))
                            .shadow(color: Color("ShadowLight"), radius: 3, x: -3, y: -3)
                            .clipShape(RoundedRectangle(cornerRadius: width/3))
                    )
                    .blur(radius: 0.5)
                    .overlay(
                        SoftSwitchKnob(isOn: configuration.$isOn, width: width)
                            .frame(width: width/3, height: width/3)
                    )
                    .animation(.spring())
                })
        }
    }
}

struct SoftSwitchKnob: View {
    @Binding var isOn: Bool
    var width: CGFloat = 50
    
    var body: some View {
        Circle()
            .fill(self.isOn ? .orange : Color("ShadowDark"))
            .offset(x: self.isOn ? width/5 : -width/5)
            .shadow(color: Color("ShadowLight"), radius: 3, x: -1, y: -1)
            .shadow(color: Color("ShadowDark"), radius: 3, x: 1, y: 1)
    }
}
