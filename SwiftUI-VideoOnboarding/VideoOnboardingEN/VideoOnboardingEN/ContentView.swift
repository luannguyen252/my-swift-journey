import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            PlayerView()
                .overlay(Color.red.opacity(0.5))
                .blur(radius: 1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image(systemName: "globe")
                .resizable()
                .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .padding(.bottom, 30)
                Text("Viettel - Your Way")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text("Pioneering in innovation and creativeness. Listening and understanding in order to provide personalized customer care.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(maxWidth: 320)
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                Spacer()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white)
                HStack {
                    Spacer()
                    Text("Log In")
                        .foregroundColor(.black)
                        .padding(20)
                    Spacer()
                    Text("Sign Up")
                        .foregroundColor(.black)
                        .padding(20)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
