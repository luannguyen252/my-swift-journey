import SwiftUI

// Colors
extension Color {
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
}

// Gradient
extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topTrailing, endPoint: .bottomTrailing)
    }
}

// Dark Background Red
struct DarkBackgroundRed<myShape: Shape>: View {
    var isTapped: Bool
    var shape: myShape

    var body: some View {
        ZStack {
            if isTapped {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .shadow(color: Color.darkStart, radius: 10, x: -5, y: -5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -10, y: -10)
                RedWave()
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

// Dark Button Red
struct DarkButtonRed: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .frame(width: 100, height: 100, alignment: .center)
            .background(
                DarkBackgroundRed(isTapped: configuration.isPressed, shape: Circle())
            )
    }
}

// Dark Background Green
struct DarkBackgroundGreen<myShape: Shape>: View {
    var isTapped: Bool
    var shape: myShape
    
    var body: some View {
        ZStack {
            if isTapped {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .shadow(color: Color.darkStart, radius: 10, x: -5, y: -5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -10, y: -10)
                GreenWave()
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

// Dark Button Green
struct DarkButtonGreen: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .frame(width: 100, height: 100, alignment: .center)
            .background(
                DarkBackgroundGreen(isTapped: configuration.isPressed, shape: Circle())
            )
       }
}

// Dark Background Blue
struct DarkBackgroundBlue<myShape: Shape>: View {
    var isTapped: Bool
    var shape: myShape

    var body: some View {
        ZStack {
            if isTapped {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .shadow(color: Color.darkStart, radius: 10, x: -5, y: -5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -10, y: -10)
                BlueWave()
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

// Dark Button Blue
struct DarkButtonBlue: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .frame(width: 100, height: 100, alignment: .center)
            .background(
                DarkBackgroundBlue(isTapped: configuration.isPressed, shape: Circle())
            )
    }
}

// Red Wave
struct RedWave: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2 }
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2}
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2 }
        }
    }
}

// Green Wave
struct GreenWave: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2 }
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .shadow(color: .green, radius: 10, x: 0.0, y: 0.0)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2}
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2 }
        }
    }
}

// Blue Wave
struct BlueWave: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2 }
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .shadow(color:.blue, radius: 10, x: 0.0, y: 0.0)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2 }
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(10)
                .foregroundColor(Color.clear)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 3)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                )
                .onAppear{ self.animationAmount = 2 }
        }
    }
}

// Design One
struct DesignOne: View {
    @State private var redButton = false
    @State private var greenButton = false
    @State private var blueButton = false
    
    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)

            VStack(spacing: 20) {
                Text("Neumorphic Design : Design One")
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white).opacity(0.8)
                    .shadow(color: .black, radius: -10, x: 0.0, y: 0.0)
                
                Spacer().frame(width: 100, height: 50, alignment: .center)
                
                ZStack {
                    // Like
                    Button(action: {
                        self.redButton.toggle()
                    }){
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .foregroundColor(.black)
                            .shadow(color: .darkEnd, radius: 5, x: 0, y: 0)
                    }
                    .buttonStyle(DarkButtonRed())
                    
                    if redButton {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .foregroundColor(.red)
                            .shadow(color: .red, radius: 5, x: 0, y: 0)
                    }
                }
                
                Spacer()
                    .frame(width: 100, height: 50, alignment: .center)
                
                ZStack {
                    // Comment
                    Button(action: {
                        self.greenButton.toggle()
                    }) {
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .foregroundColor(.black)
                            .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                    }
                    .buttonStyle(DarkButtonGreen())
                    
                    if greenButton {
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .foregroundColor(.green)
                            .shadow(color: .green, radius: 5, x: 0, y: 0)
                    }
                }
                
                Spacer()
                    .frame(width: 100, height: 50, alignment: .center)
                
                ZStack {
                    // Share
                    Button(action: {
                        self.blueButton.toggle()
                    }) {
                        Image(systemName: "location.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .foregroundColor(.black)
                            .shadow(color: .darkEnd, radius: 5, x: 0.0, y: 0.0)
                    }
                    .buttonStyle(DarkButtonBlue())
                    
                    if blueButton {
                        Image(systemName: "location.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .foregroundColor(.blue)
                            .shadow(color: .blue, radius: 5, x: 0, y: 0)
                    }
                }
                
                Spacer()
                    .frame(width: 100, height: 50, alignment: .center)
                
                Text("The App Wizard")
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
                    .shadow(color: .black, radius: -10, x: 0.0, y: 0.0)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DesignOne_Previews: PreviewProvider {
    static var previews: some View {
        DesignOne()
    }
}
