import SwiftUI

struct ContentView: View {
    var body: some View {
        Rating()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Rating: View {
    // Slider Value
    @State var value: CGFloat = 0.5
    
    var body: some View {
        VStack {
            Text("How are you feeling today?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.top, 16)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            // Eyes
            HStack(spacing: 24) {
                ForEach(1...2, id: \.self) { _ in
                    ZStack {
                        // Eye Left
                        Eyes()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100)
                        
                        // Eye Right
                        Eyes(value: value)
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100)
                            .rotationEffect(.init(degrees: 180))
                            .offset(y: -100)
                        
                        // Eye Dot
                        Circle()
                            .fill(Color.black)
                            .frame(width: 13, height: 13)
                            .offset(y: -30)
                    }
                    .frame(height: 100)
                }
            }
            
            // Smile
            Smile(value: value)
                .stroke(Color.black, lineWidth: 3)
                .frame(height: 100)
                .padding(.top, 40)
            
            // Custom Slider
            GeometryReader { reader in
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    // Point Bar
                    Color.black.opacity(0.25)
                        .frame(height: 1)
                    // Drag Point
                    Image(systemName: "arrow.right")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 48, height: 48)
                        .background(Color.black)
                        .cornerRadius(24)
                        // Since drag point size is 48
                        .offset(x: value * (reader.frame(in: .global).width - 48))
                        .gesture(DragGesture().onChanged({ (value) in
                            let width = reader.frame(in: .global).width - 48
                            // Since horixontally padding = 30
                            let drag = value.location.x - 30
                            // Limiting drag
                            if drag > 0 && drag <= width {
                                self.value = drag / width
                            }
                        }))
                })
            }
            .padding()
            .frame(height: 48)
            
            Spacer(minLength: 0)
            
            // Button
            Button(action: {}, label: {
                Text("Done")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .background(Capsule().fill(Color.black))
            })
            .padding(.bottom)
        }
        .padding(8)
        .background(
            (value <= 0.3 ? Color("Color1") : (value > 0.3 && value <= 0.7 ? Color("Color2") : Color("Color3")))
                .ignoresSafeArea(.all, edges: .all)
                .animation(.easeInOut)
        )
    }
}

// Smile Shape
struct Smile: Shape {
    var value: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let center = rect.width / 2
            // Changing Values For Up Curve And Down Curve
            let downRadius: CGFloat = (115 * value) - 45
            
            path.move(to: CGPoint(x: center - 150, y: 0))
            
            let to1 = CGPoint(x: center, y: downRadius)
            let control1 = CGPoint(x: center - 145, y: 0)
            let control2 = CGPoint(x: center - 145, y: downRadius)
            
            let to2 = CGPoint(x: center + 150, y: 0)
            let control3 = CGPoint(x: center + 145, y: downRadius)
            let control4 = CGPoint(x: center + 145, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

// Eye Shape
struct Eyes: Shape {
    // Optional Values For Only Changing Top Eye Curve Position
    var value: CGFloat?
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let center = rect.width / 2
            
            // Changing Values For Up Curve And Down Curve
            let downRadius : CGFloat = 55 * (value ?? 1)
            
            path.move(to: CGPoint(x: center - 40, y: 0))
            
            let to1 = CGPoint(x: center, y: downRadius)
            let control1 = CGPoint(x: center - 40, y: 0)
            let control2 = CGPoint(x: center - 40, y: downRadius)
            
            let to2 = CGPoint(x: center + 40, y: 0)
            let control3 = CGPoint(x: center + 40, y: downRadius)
            let control4 = CGPoint(x: center + 40, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}
