import SwiftUI

struct Introduction: View {
    @State var transparency = false
    
    var body: some View {
        Text("First SwiftUI")
            .font(.largeTitle)
            .foregroundColor(Color("orange"))
            .scaleEffect(transparency ? 0 : 1)
            .animation(Animation.spring().repeatForever(autoreverses: true))
            .onAppear() {
                transparency.toggle()
            }
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
