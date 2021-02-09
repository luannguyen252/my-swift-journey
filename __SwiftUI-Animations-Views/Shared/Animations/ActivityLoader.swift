import SwiftUI

struct ActivityLoader: View {
    @State var animate = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.orange,.red]), center: .center), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width:45,height: 45)
                .rotationEffect(.degrees(animate ? 360: 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            
            Text("Please wait...")
                .foregroundColor(.orange).padding(.top,10)
        }
        .padding(20)
        .background(Color.black)
        .cornerRadius(15)
        .onAppear{
            animate.toggle()
        }
    }
}
