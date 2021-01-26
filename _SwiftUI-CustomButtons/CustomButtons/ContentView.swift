import SwiftUI

struct ContentView: View {
    @State var favourite = false
    var body: some View {
        ZStack {
            Color.white
            Button(action: {
                self.favourite.toggle()
            }) {
                HStack {
                    Image(systemName: favourite ? "star.fill" : "star")
                        .foregroundColor(favourite ? Color.yellow : Color.gray)
                    Text("Favourite")
                        .foregroundColor(Color.white)
                }
            }
            .buttonStyle(OutlineBoarder(color: Color.black))
            .padding()
        }.ignoresSafeArea()
    }
}


extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
}

struct neumorphic: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal,20)
            .padding(10)
            .background(Color.background)
            .cornerRadius(5)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct OutlineButton: ButtonStyle {
    
    var color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(10)
            .border(color, width: 1)
            .foregroundColor(.white)
            .padding(2)
            .shadow(radius: 10)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        
    }
}

struct OutlineBoarder: ButtonStyle {
 
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(10)
            .background(configuration.isPressed ? color.opacity(0.5) : color)
            .foregroundColor(.white)
            .padding(2)
            .border(color, width: 1)
            .shadow(radius: 10)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
    }
}

struct RoundedCorners: ButtonStyle {
 
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .padding(10)
            .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(color, lineWidth: 1)
               )
        }
}

struct GradientBackgroundStyle: ButtonStyle {
 
    var startColor: Color
    var endColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing).opacity(configuration.isPressed ? 0.5 : 1))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 10)
    }
}

struct DefaultButtons: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Button("Plain", action: {
            }).buttonStyle(PlainButtonStyle())

            Button("Borderless", action: {
            }).buttonStyle(BorderlessButtonStyle())

            Button("Default", action: {
            }).buttonStyle(DefaultButtonStyle())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
