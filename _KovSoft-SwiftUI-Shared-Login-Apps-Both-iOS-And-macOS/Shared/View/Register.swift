import SwiftUI

struct Register: View {
    @EnvironmentObject var homeData: LoginViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            Label(
                title: {
                    Text("Please Register")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                },
                
                icon: {
                    // Back Button
                    Button(action: {
                        homeData.clearData()
                        // Moving View Back To Login
                        withAnimation{
                            homeData.gotoRegister.toggle()
                        }
                    }, label: {
                        Image("right")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: 180))
                    })
                    .buttonStyle(PlainButtonStyle())
                })
            
            Label(
                title: {
                    TextField("Enter Email", text: $homeData.email)
                        .textFieldStyle(PlainTextFieldStyle())
                },
                icon: { Image(systemName: "envelope")
                    .frame(width: 32)
                    .foregroundColor(.gray)
                })
            
            Divider()
            
            Label(
                title: {
                    SecureField("Password", text: $homeData.password)
                        .textFieldStyle(PlainTextFieldStyle())
                },
                icon: { Image(systemName: "lock")
                    .frame(width: 30)
                    .foregroundColor(.gray)
                })
                .overlay(
                    Button(action: {
                        print("Button is pressed.")
                    }, label: {
                        Image(systemName: "eye")
                            .foregroundColor(.gray)
                    })
                    .buttonStyle(PlainButtonStyle())
                    ,alignment: .trailing
                )
                
            
            Divider()
            
            Label(
                title: {
                    SecureField("Re-Enter Password", text: $homeData.reEnter)
                        .textFieldStyle(PlainTextFieldStyle())
                },
                icon: { Image(systemName: "lock")
                    .frame(width: 32)
                    .foregroundColor(.gray)
                })
            
            Divider()
        })
        .modifier(LoginViewModifier())
    }
}

struct Resigter_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
