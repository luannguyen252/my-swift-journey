import SwiftUI
import PlaygroundSupport

struct SignUpView: View {
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                
                NavigationLink(destination: WelcomeView()) {
                    Text("Sign up")
                }
            }
            .navigationBarTitle("Sign up")
        }
        .accentColor(.primary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.green)
            Text("Welcome")
                .font(.title)
        }
    }
}

PlaygroundPage.current.setLiveView(SignUpView())
