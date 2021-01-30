import SwiftUI

struct ContentView: View {
    let text = Text("SwiftUI is a good tool for Designers")
        .font(Font.largeTitle.bold())
    
    var body: some View {
        text
            .foregroundColor(.clear)
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [.orange, .red, .purple, .blue]),
                    startPoint: .trailing,
                    endPoint: .leading
                )
                .mask(text))
            .padding(16)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
