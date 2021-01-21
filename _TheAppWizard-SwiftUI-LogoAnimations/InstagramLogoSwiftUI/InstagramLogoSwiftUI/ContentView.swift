import SwiftUI

struct ContentView: View {
    @State private var textview = false
    
    var body: some View {
            ZStack {
               InstagramBody()
               GlassShapeCard()
               InstagramRing()

            VStack {
                Text("The App Wizard")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .opacity(0.2)
            Spacer()
                .frame(height: 400)
                
            Text("Welcome To Instagram")
                 .font(.headline)
                 .fontWeight(.light)
                 .foregroundColor(Color.white)
                 .opacity(textview ? 1 : 0)
                 .animation(Animation.easeIn(duration: 10).repeatCount(1))
                 .onAppear(){ self.textview.toggle() } }
            }
    }
}

struct InstagramBody: View {
    @State private var yellowball = false
    @State private var orangeball = false
    @State private var pinkball = false
    @State private var purpleball = false
    @State private var blueball = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Circle()
                .frame(width: 250, height: 250, alignment: .center)
                .foregroundColor(.pink)
                .blur(radius: 20)
                .offset(x: pinkball ? -20 : 150, y: pinkball ? 20 : -300)
                .animation(Animation.easeIn(duration: 1).delay(1).repeatCount(1)).onAppear(){ self.pinkball.toggle() }
            
            Circle()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.purple)
                .blur(radius: 10)
                .offset(x: purpleball ? -50 : -150, y: purpleball ? -70 : -300)
                .animation(Animation.easeIn(duration: 1).delay(1).repeatCount(1)).onAppear(){ self.purpleball.toggle() }
            
            Circle()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(.orange)
                .blur(radius: 20)
                .offset(x: orangeball ? -60 : 150, y: orangeball ? 60 : 300)
                .animation(Animation.easeIn(duration: 1).delay(1).repeatCount(1)).onAppear(){ self.orangeball.toggle() }
            
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.yellow)
                .offset(x: yellowball ? -50 : -150, y: yellowball ? 50 : 300)
                .blur(radius: 20)
                .animation(Animation.easeIn(duration: 1).delay(1).repeatCount(1)).onAppear(){ self.yellowball.toggle() }
            
            Circle()
                .frame(width: 140, height: 140, alignment: .center)
                .foregroundColor(.blue)
                .opacity(0.4)
                .blur(radius: 20)
                .offset(x: blueball ? -50 : 150, y: blueball ? -70 : 100)
                .animation(Animation.easeIn(duration: 1).delay(1).repeatCount(1)).onAppear(){ self.blueball.toggle() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InstagramRing: View {
    @State private var ringanim: CGFloat = 0.0
    @State private var borderanim: CGFloat = 0.0
    @State private var dot = false
    let timer1 = Timer.publish(every: 3.5, on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Rounded Logo Rectangle
            RoundedRectangle(cornerRadius: 25.0)
                .trim( from: 0, to: self.borderanim)
                .stroke(Color.white, lineWidth: 12)
                .frame(width: 150, height: 150, alignment: .center)
                .rotationEffect(.degrees(-90))
                .onReceive(timer2) { _ in
                    withAnimation {
                        guard self.borderanim < 1 else { return }
                        self.borderanim += 1
                    }
                }
            
            // Trim Circle Animation
            Circle()
                .trim( from: 0, to: self.ringanim)
                .stroke(Color.white, lineWidth: 12)
                .frame(width: 75, height: 75, alignment: .center)
                .rotationEffect(.degrees(-90))
                .onReceive(timer1) { _ in
                    withAnimation {
                        guard self.ringanim < 1 else { return }
                        self.ringanim += 1
                    }
                }
            
            // Instagram Dot
            Circle()
                .frame(width: 18, height: 18, alignment: .center)
                .foregroundColor(.white)
                .offset(x: dot ? 50 : 150, y: dot ? -50 : 100)
                .animation(Animation.easeIn(duration: 2).repeatCount(1))
                .onAppear( ){ self.dot.toggle() }
        }
    }
}

struct GlassShapeCard: View {
    @State private var borderglass : CGFloat = 0.0
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .trim( from: 0, to: self.borderglass)
                .stroke(Color.white, lineWidth: 0.1)
                .shadow(color: .gray, radius: 10, x: 0, y: 0.0)
                .frame(width: 500, height: 300, alignment: .center)
                .rotationEffect(.degrees(-90))
                .onReceive(timer) { _ in
                    withAnimation {
                        guard self.borderglass < 1 else { return }
                        self.borderglass += 1
                    }
                }
        }
    }
}
