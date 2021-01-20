import SwiftUI

struct ContentView: View {
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            // Background
            Color.purple
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                Text("SIMPLE LOGIN SCREEN")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                
                Image("admin")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                }
                .padding([.leading, .trailing], 27.5)
                
                Button(action: {
                    print("Button Pressed!")
                }, label: {
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                .padding(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
