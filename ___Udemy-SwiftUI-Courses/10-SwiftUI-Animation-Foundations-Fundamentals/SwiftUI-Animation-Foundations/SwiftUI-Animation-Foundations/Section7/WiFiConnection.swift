import SwiftUI

struct WiFiConnection: View {
    @State private var showConnecting = false
    
    var body: some View {
        VStack(spacing: 56) {
            Text("Wi-Fi Connection")
                .font(.largeTitle)
            
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 300, height: 300, alignment: .center)
                
                Image(systemName: "wifi")
                    .clipShape(Rectangle().offset(y: showConnecting ? 0 : 120))
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .offset(y: -100)
                    .animation(Animation.easeInOut(duration: 1.5).delay(1).repeatForever(autoreverses: false))
                    .onAppear() {
                        showConnecting.toggle()
                    }
            }
        }
    }
}

struct WiFiConnection_Previews: PreviewProvider {
    static var previews: some View {
        WiFiConnection()
    }
}
