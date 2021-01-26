
import SwiftUI

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}

struct ChatTextField: View {
    @State private var mess: String = ""
    var body: some View {
        HStack {
            TextField("Type a message...",text:$mess)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2))
                .cornerRadius(9)
            if mess != "" {
                Button(action: {
                }, label: {
                    Image(systemName: "paperplane.circle.fill").font(.system(size:20)).foregroundColor(Color.blue)
                }).buttonStyle(BorderlessButtonStyle())
            }
        }.padding(.all, 15).background(BlurView(material: NSVisualEffectView.Material.menu, blendingMode: NSVisualEffectView.BlendingMode.withinWindow)).animation(.easeOut)
    }
}

struct ChatTextField_Previews: PreviewProvider {
    static var previews: some View {
        ChatTextField()
    }
}
