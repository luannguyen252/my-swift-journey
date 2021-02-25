import SwiftUI

struct JustBreath: View {
    @State private var grow                 = false // Scale the middle from 0.5 to 1
    @State private var rotateFarRight       = false
    @State private var rotateFarLeft        = false
    @State private var rotateMiddleLeft     = false
    @State private var rotateMiddleRight    = false
    @State private var showShadow           = false
    @State private var showRightStroke      = false
    @State private var showLeftStroke       = false
    @State private var changeColor          = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all, edges: .all)
            VStack {
                Spacer()

                // Pull content from DetailsViwl.swift
                DetailsView()
                
                Spacer()
                
                ZStack {
                    Image("flower") // Middle
                        .scaleEffect(grow ? 1 : 0.5, anchor: .bottom)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            grow.toggle()
                        }

                    Image("flower")  // Middle left
                        .rotationEffect(.degrees( rotateMiddleLeft ? -25 : -5), anchor: .bottom)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            rotateMiddleLeft.toggle()
                            }

                    Image("flower")  // Middle right
                        .rotationEffect(.degrees( rotateMiddleRight ? 25 : 5), anchor: .bottom)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            rotateMiddleRight.toggle()
                        }
                    
                    Image("flower")  // Left
                        .rotationEffect(.degrees( rotateFarLeft ? -50 : -10), anchor: .bottom)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            rotateFarLeft.toggle()
                        }
                    
                    Image("flower")  // Right
                        .rotationEffect(.degrees( rotateFarRight ? 50 : 10), anchor: .bottom)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            rotateFarRight.toggle()
                        }
                    
                    Circle()  // Quarter dotted circle left
                        .trim(from: showLeftStroke ? 0 : 1/4, to: 1/4)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [1, 14]))
                        .frame(width: 215, height: 215, alignment: .center)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .rotationEffect(.degrees(-180), anchor: .center)
                        .offset(x: 0, y: -25)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            showLeftStroke.toggle()
                            }
                                
                    Circle()  // Quarter dotted circle right
                        .trim(from: 0, to: showRightStroke ? 1/4 : 0)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [1, 14]))
                        .frame(width: 215, height: 215, alignment: .center)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .rotationEffect(.degrees(-90), anchor: .center)
                        .offset(x: 0, y: -25)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                        .onAppear {
                            showRightStroke.toggle()
                        }
                } // Container for flower
                .shadow(radius: showShadow ? 20 : 0) // Switching from flat to elevation
                .hueRotation(Angle(degrees: changeColor ? -45 : 45)) // Animating Chroma
                .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear {
                    changeColor.toggle()
                    showShadow.toggle()
                }
                
                Spacer()
                
                Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))
                    .frame(width: 92, height: 46, alignment: .center)
                    .cornerRadius(23)
                    .opacity(0.5)
                    .overlay(Text("End"))
                
                Spacer()
            }
        }
    }
}

// Details View
struct DetailsView: View {
    @State private var breatheIn    = true
    @State private var breatheOut   = false
    
    var body: some View {
        VStack{
            VStack(spacing: 4) {
                Text("Just Breathe")
                    .font(.largeTitle)
                
                Text("Conquer the anxiety of life")
                    .font(.title)
                
                Text("Live in the moment")
                    .font(.title2)
                
                Text("Live in Breath")
                    .font(.title3)
            }
            .foregroundColor(.white)
              
            ZStack {
                Text("Breathe Out")
                    .opacity(breatheOut ? 0 : 1) // Opacity animation
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                         breatheOut.toggle()
                }
                
                Text("Breathe In")
                    .opacity(breatheIn ? 0 : 1)
                    .scaleEffect(breatheIn ? 0 : 1, anchor: .center)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear() {
                        breatheIn.toggle()
                    }
            }
            .foregroundColor(.white)
            .padding(.top, 50)
        }
    }
}

struct JustBreath_Previews: PreviewProvider {
    static var previews: some View {
        JustBreath()
    }
}
