import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Apple TV")
                .font(.headline)
            
            Rectangle()
                .foregroundColor(Color(UIColor.secondarySystemBackground))
                .cornerRadius(40)
            
            HStack(spacing: 24) {
                VStack(spacing: 16) {
                    Button(icon: "mic.fill")
                    Button(icon: "playpause.fill")
                }
                
                VStack {
                    Text("MENU")
                        .font(.headline)
                }
                .frame(width: 144, height: 144)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(144)
                
                VStack(spacing: 16) {
                    Button(icon: "tv")
                    Button(icon: "magnifyingglass")
                }
            }
        }
        .frame(width: 330)
    }
}

struct Button: View {
    var icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
        }
        .frame(width: 64, height: 64)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(32)
    }
}

PlaygroundPage.current.setLiveView(ContentView())