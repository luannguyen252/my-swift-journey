import SwiftUI

struct CustomRotationModifier: ViewModifier {
    var offsetValue: Double // 0...1
    
    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(radians: Double.pi*(abs(offsetValue-0.5)-0.5)))
    }
}

struct CustomRotationEffect: GeometryEffect {
    var offsetValue: Double // 0...1
    
    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let angle = Double.pi*(abs(offsetValue-0.5)-0.5)
        
        let affineTransform = CGAffineTransform(translationX: size.width*0.5, y: size.height*0.5)
        .rotated(by: CGFloat(angle))
        .translatedBy(x: -size.width*0.5, y: -size.height*0.5)
        
        return ProjectionTransform(affineTransform)
    }
}

struct ContentView: View {
    @State var sliderValue: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "smiley")
                .font(.title)
                .padding()
                .modifier(CustomRotationEffect(offsetValue: self.sliderValue))
            Slider(value: $sliderValue, in: 0...1, step: 0.01)
            
            HStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.sliderValue = 0
                    }
                }) {
                    Text("Set to 0").padding()
                }
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.sliderValue = 1
                    }
                }) {
                    Text("Set to 1").padding()
                }
            }
            .padding()
            Spacer()
            
        }
        .padding()
    }
}


struct LikeEffect: GeometryEffect {
    var offsetValue: Double // 0...1
    
    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let reducedValue = offsetValue - floor(offsetValue)
        let value = 1.0-(cos(2*reducedValue*Double.pi)+1)/2

        let angle  = CGFloat(Double.pi*value*0.3)
        let translation   = CGFloat(20*value)
        let scaleFactor  = CGFloat(1+1*value)
        
        
        let affineTransform = CGAffineTransform(translationX: size.width*0.5, y: size.height*0.5)
        .rotated(by: CGFloat(angle))
        .translatedBy(x: -size.width*0.5+translation, y: -size.height*0.5-translation)
        .scaledBy(x: scaleFactor, y: scaleFactor)
        
        return ProjectionTransform(affineTransform)
    }
}

struct LikeButtonView: View {
    @State var likes : Double = 0
    
    var body: some View {
        HStack {
            Text("likes: \(Int(likes))")
                .frame(width: 150, alignment: .leading)
                .padding()
            Button(action:{
                withAnimation(.spring()) {
                    self.likes += 1
                }
            }) {
                HStack {
                    Text("like more")
                    Image(systemName: self.likes==0 ? "hand.thumbsup" : "hand.thumbsup.fill")
                        .modifier(LikeEffect(offsetValue: likes))
                }
                .padding()
            }
        }
    }
}

struct JumpyEffect: GeometryEffect {
    var offsetValue: Double // 0...1
    
    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let reducedValue = offsetValue - floor(offsetValue)
        let value = 1.0-(cos(2*reducedValue*Double.pi)+1)/2

        let translation   = CGFloat(-50*value)
        
        let affineTransform = CGAffineTransform(translationX: translation, y: 0)
        
        return ProjectionTransform(affineTransform)
    }
}

struct JumpyMenuView: View {
    @State var selectedOption : Int = 0
    @State var menuOffset : Double = 0
    
    let itemHeight: CGFloat = 40
    
    var body: some View {
        HStack (alignment: .top){
            Circle()
                .fill(Color.orange)
                .frame(width:10, height:10)
                .offset(x: 20, y: (CGFloat(self.selectedOption) * self.itemHeight + 15.0) )
                .modifier(JumpyEffect(offsetValue: self.menuOffset))
            VStack (alignment: .leading, spacing: 0){
                ForEach(0..<6) { index in
                    Button(action:{
                        withAnimation(.spring()) {
                            self.selectedOption = index
                            self.menuOffset += 1
                        }
                    }) {
                        HStack {
                            Image(systemName: "\(index).circle")
                            Text("Jumpy Menu Item")
                        }
                    }
                    .frame(height: self.itemHeight)
                    //.background(self.selectedOption == index ? Color.gray.opacity(0.2) : Color.white)
                    .rotation3DEffect(Angle(degrees: self.selectedOption == index ? -30 : 5), axis: (x: 0, y: 1, z: 0))
                }
            }
        }
    }
}

struct ContentViewFinal: View {
    var body: some View {
        JumpyMenuView()
    }
}

struct ContentViewFinal_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewFinal()
    }
}
