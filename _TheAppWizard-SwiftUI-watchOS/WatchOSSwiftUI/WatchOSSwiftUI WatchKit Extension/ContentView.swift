import SwiftUI

struct ContentView: View {
    @State private var lock = false
    @State private var tilt = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white).opacity(0.1)
                .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 4))
                .shadow(radius: 10)
                .frame(width: 100, height: 100, alignment: .center)
            
            VStack {
                Spacer()
                
                Text("The App Wizard").font(.body)
                    .fontWeight(.light)
                    .foregroundColor(.pink).opacity(0.7)
            }

            ZStack {
                Rectangle()
                    .frame(width: 64, height: 64)
                    .cornerRadius(15)
                    .foregroundColor(.pink).opacity(1)
                
                Capsule()
                    .trim(from: lock ? 0 : 3/4, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(width: 44, height: 74)
                    .foregroundColor(.pink).opacity(0.5)
                    .offset(y: -30)
                    .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.5).repeatCount(1, autoreverses:  true))
                    .onAppear() { self.lock.toggle() }
                
                // Image(systemName: "folder.fill")
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
            }
            
            // Whole ZStack Rotation
            .rotationEffect(.degrees(tilt ? 0 : 30))
            .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.5).repeatCount(1 , autoreverses:  true))
            .onAppear() { self.tilt.toggle() }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

