import SwiftUI

struct makeCall: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calling.. Scarlett Johansson")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                
                Image("p7")
                    .resizable()
                    .frame(width: 400, height: 600, alignment: .center)
                    .cornerRadius(25)
                
                Spacer(minLength: 0)
                
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.red)
                        .overlay(
                            Circle()
                                .stroke(Color.red)
                                .scaleEffect(animationAmount)
                                .opacity(Double(2 - animationAmount))
                                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false)))
                        .onAppear() { self.animationAmount += 2 }
                    
                    Image(systemName: "video.fill")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100, alignment: .center)
                }
            }
        }
    }
}

struct makeCall_Previews: PreviewProvider {
    static var previews: some View {
        makeCall()
    }
}
