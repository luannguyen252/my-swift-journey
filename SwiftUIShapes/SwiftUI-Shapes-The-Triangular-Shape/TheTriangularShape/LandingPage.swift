//   | @BigMtnStudio

import SwiftUI

struct LandingPage: View {
    var body: some View {
        NavigationView {
            GeometryReader { gp in
                ZStack {
                    Color.themeBackground
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack(spacing: 3) {
                            Triangle(xOffset: 1)
                                .frame(width: 45)
                            Triangle()
                                .frame(width: 45)
                        }
                        .foregroundColor(.themeTertiary)
                        .scaleEffect(y: -1, anchor: .center)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .offset(y: 40)
                        
                        VStack(spacing: 40.0) {
                            HStack(spacing: 16.0) {
                                NavigationLink(destination: TriangleFilled()) {
                                    Text("Fill Me")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Triangle()
                                                        .fill(Color.themeAccent))
                                }
                                
                                NavigationLink(destination: TrianglesMask()) {
                                    Text("Clip Me")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Triangle(xOffset: 1)
                                                        .fill(Color.themeAccent))
                                }
                            }
                            
                            HStack(spacing: 16.0) {
                                NavigationLink(destination: TrianglesOverlapping()) {
                                    Text("Layer Me")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Triangle()
                                                        .fill(Color.themeAccent))
                                }
                                
                                NavigationLink(destination: TriangleAnimated()) {
                                    Text("Animate Me")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Triangle(xOffset: 1)
                                                        .fill(Color.themeAccent))
                                }
                            }
                        }
                        .foregroundColor(.themeForeground)
                        .padding([.horizontal, .bottom])
                        .frame(height: gp.size.height * 0.6)
                        
                        Spacer()
                    }
                }
                .foregroundColor(.themeForeground)
            }
            .navigationTitle("The Triangle Shape")
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
            .preferredColorScheme(.dark)
    }
}
