import SwiftUI

struct TimerView: View {
    @State var minutes: CGFloat = 0
    @State var seconds: CGFloat = 0
    @State var milliSeconds: CGFloat = 0
    
    @State var timerStarted = false
    
    static var secondsTimer = Timer()
    static var millisecondsTimer = Timer()
    
    static let secondsLimit: CGFloat = 60
    
    static var trackColor: Color = Color(white: 0.3)
    static var fillColor: Color = Color.red
    static var alternateColor: Color  = Color.orange
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 10))
                .foregroundColor(Self.trackColor)
                .frame(width: 340, height: 340)
            
            Circle()
                .trim(from: 0, to: self.timerStarted ? (self.seconds + 1) / Self.secondsLimit : 0)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: 270))
                .foregroundColor(Self.fillColor)
                .frame(width: 340, height: 340)
                .padding()
                .animation(self.seconds == 0 ? Animation.interactiveSpring().speed(2) : Animation.linear(duration: 1))
                
                .onAppear()
            
            TimerLabel(minutes: self.minutes, seconds: self.seconds, milliSeconds: self.milliSeconds)
            
            HStack {
                Button(action: {
                    self.timerStarted.toggle()
                    if (self.timerStarted) {
                        self.minutes = 0
                        self.seconds = 1
                        self.milliSeconds = 0
                        self.resetColors()
                        
                        Self.secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.milliSeconds = 0
                            self.seconds += 1
                            if (self.seconds == Self.secondsLimit) {
                                self.swapColors()
                                
                                self.seconds = 0
                                self.minutes += 1
                            }
                        }
                        Self.millisecondsTimer = Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true, block: { _ in
                            self.milliSeconds += 1
                        })
                    } else {
                        Self.secondsTimer.invalidate()
                        Self.millisecondsTimer.invalidate()
                    }
                }) {
                    
                    Text(!self.timerStarted ? "Start" : "Stop")
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 42)
                        .background(self.timerStarted ? Color.red : Color.purple)
                        .animation(.easeOut(duration: 0.25))
                        .cornerRadius(18)
                    
                }
            }.offset(y: UIScreen.main.bounds.height / 2 - 84)
        }
    }
    
    func swapColors() {
        Self.trackColor = Self.fillColor
        let tempColor = Self.fillColor
        Self.fillColor = Self.alternateColor
        Self.alternateColor = tempColor
    }
    
    func resetColors() {
        Self.trackColor = Color(white: 0.3)
        Self.fillColor = Color.red
        Self.alternateColor = Color.orange
    }
}

struct TimerLabel: View {
    var minutes: CGFloat
    var seconds: CGFloat
    var milliSeconds: CGFloat
    
    var body: some View {
        ZStack {
            Text("\(minutes.toString()):\(seconds.toString()):\(milliSeconds.toString())")
                .font(.system(size: 42, weight: .bold, design: .monospaced))
                .colorInvert()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

extension CGFloat {
    func toString() -> String {
 if (self < 10) {
            return String("0\(Int(self))")
        } else {
            return String("\(Int(self))")
        }
    }
}
