import SwiftUI

struct AnimationTextField: View {
    @State var isEditing = true
    @State var text = ""
    
    var body: some View {
        Group {
            TextField("Tap to say sth...", text: $text)
                .font(.system(size: 32, weight: .black))
                .foregroundColor(.black)
                .accentColor(.blue)
                .padding(.horizontal, 32)
                .padding(.vertical, 32)
                .background(isEditing ?
                    Color.blue.frame(width: nil, height: nil).offset(x: 0) :
                    Color.white.frame(width: 0, height: 0).offset(x: 64.0 - UIScreen.main.bounds.size.width / 2)
            )
            .cornerRadius(10)
                .animation(.spring())
                .onTapGesture {
                    self.isEditing.toggle()
            }
        }
        .padding(.horizontal, 32)
    }
}

struct AnimationTextField_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTextField()
    }
}
