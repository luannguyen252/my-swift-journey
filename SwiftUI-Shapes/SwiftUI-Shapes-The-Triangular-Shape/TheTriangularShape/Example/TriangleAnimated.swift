//   | @BigMtnStudio

import SwiftUI

struct TriangleAnimated: View {
    @State private var degrees: Double = 0
    @State private var change = false
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        GeometryReader { gp in
            ZStack {
                Color.themeBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        ForEach(1 ..< 11) { index in
                            Triangle()
                                .fill(Color.themeTertiary)
                                .opacity(0.1)
                                .frame(width: 100.0, height: 150.0)
                                .rotationEffect(.degrees(degrees * Double(index)), anchor: .leading)
                        }
                    }
                    .scaleEffect(change ? 3 : 1, anchor: .center)
                }
                
                ScrollView {
                    ScrollViewReader { svp in
                        VStack(spacing: 20) {
                            LoginHeaderView()
                            
                            UsernameFieldView(username: $username, scrollviewproxy: svp)
                            
                            PasswordFieldView(password: $password, scrollviewproxy: svp)
                            
                            LoginFooterView()
                        }
                        .padding(.horizontal)
                        .offset(x: change ? 0 : gp.size.width)
                        .animation(Animation.easeOut(duration: 1).delay(0.2))
                    }
                }
            }
            .foregroundColor(.themeForeground)
            .onAppear {
                withAnimation(Animation.easeOut(duration: 0.7)) {
                    degrees = 36
                    change = true
                }
            }
        }
        .navigationTitle("Animated Triangles")
    }
}

struct TriangleAnimated_Previews: PreviewProvider {
    static var previews: some View {
        TriangleAnimated()
    }
}

struct LoginHeaderView: View {
    var body: some View {
        Group {
            Spacer(minLength: 100)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            
            Spacer()
            
            Image(systemName: "leaf.fill")
                .font(.system(size: 70))
                .foregroundColor(Color(#colorLiteral(red: 0.2682060208, green: 0.6722317753, blue: 0.4687413699, alpha: 1)))
                .shadow(radius: 2, y: 2)
            
            Spacer()
        }
    }
}

struct LoginFooterView: View {
    var body: some View {
        Group {
            Button(action: {}) {
                Text("Log In")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                                    .fill(Color.themeAccent)
                                    .shadow(radius: 2, y: 2))
            }
            Spacer()
        }
    }
}

struct PasswordFieldView: View {
    @Binding var password: String
    var scrollviewproxy: ScrollViewProxy
    
    var body: some View {
        HStack {
            Image(systemName: "lock.shield")
                .font(Font.system(.body).weight(.thin))
                .foregroundColor(.themeForeground)
            SecureField("password", text: $password)
                .id("password")
                .onTapGesture {
                    scrollviewproxy.scrollTo("password", anchor: .center)
                }
        }
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.themeForeground, lineWidth: 0.5))
    }
}

struct UsernameFieldView: View {
    @Binding var username: String
    var scrollviewproxy: ScrollViewProxy
    
    var body: some View {
        HStack {
            Image(systemName: "envelope")
                .font(Font.system(.body).weight(.thin))
                .foregroundColor(.themeForeground)
            TextField("username", text: $username)
                .id("username")
                .onTapGesture {
                    scrollviewproxy.scrollTo("username", anchor: .center)
                }
        }
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.themeForeground, lineWidth: 0.5))
    }
}
