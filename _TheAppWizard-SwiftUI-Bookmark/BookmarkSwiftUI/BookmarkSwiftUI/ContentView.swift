import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background
            Color.black
            .opacity(1)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Bookmark Button")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                // First Create Simple Button
                Button(action: {
                    print("Button action: 1")
                }) {
                    HStack {
                        Image(systemName: "bookmark.fill")
                        Text("Bookmark")
                    }
                }
                .buttonStyle(GradientButtonStyle())
            }
        }
    }
}

// Create Button Gradient
struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            
            // For adding Gradient
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            
            // Add Scale Effect
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .animation(.easeIn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
