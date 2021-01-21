import SwiftUI

// Color
extension Color{
    static let offWhite = Color(red : 255 / 255, green : 255 / 255 , blue : 235 / 255)
}

// Content View
struct ContentView: View {
    var body: some View {
        ZStack{
            Color.purple.opacity(0.1)
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.offWhite)
                        .frame(width : 380 , height: 120)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.8), radius: 10, x: -5, y: -5)
                        .padding(.all)
                
                    Text("Neumorphism SwiftUI")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                }
                
                ZStack {
                    // It Can Be Used To Create Cards
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.offWhite)
                        .frame(width : 380 , height: 500)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.8), radius: 10, x: -5, y: -5)
                        .padding(.all)
                    
                    VStack {
                        Image("AppWizard")
                            .resizable()
                            .frame(width:300 , height: 300)
                            .cornerRadius(150)
                            .shadow(color: Color.gray, radius: 10, x: 10, y: 10)
                        
                        Text("THE APP WIZARD")
                            .font(.largeTitle)
                            .fontWeight(.ultraLight)
                            .foregroundColor(Color.black)
                            .padding(.all)
                    }
                }
                
                // Horizontal Stack
                HStack {
                    VStack {
                        Button(action: {
                            print("Button Pressed!")
                        }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(SimpleButtonStyle1())
                        
                        Text("LIKE")
                            .font(.headline)
                            .fontWeight(.thin)
                    }
                    .padding(.trailing)
                    
                    VStack {
                        Button(action: {
                            print("Button Pressed!")
                        }) {
                            Image(systemName: "message.fill")
                                .foregroundColor(.green)
                        }
                        .buttonStyle(SimpleButtonStyle1())
                        
                        Text("COMMENT")
                            .font(.headline)
                            .fontWeight(.thin)
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        Button(action: {
                            print("Button Pressed!")
                        }) {
                            Image(systemName: "location.fill")
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(SimpleButtonStyle1())
                        
                        Text("SHARE")
                            .font(.headline)
                            .fontWeight(.thin)
                    }
                    .padding(.leading)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

// Heart Button
struct SimpleButtonStyle1: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Circle()
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.8), radius: 10, x: -5, y: -5)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
