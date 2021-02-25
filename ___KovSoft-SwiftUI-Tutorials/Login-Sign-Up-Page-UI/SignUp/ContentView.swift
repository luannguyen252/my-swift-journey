//
//  ContentView.swift
//  SignUp
//
//  Created by Balaji on 03/07/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ContentView()
    }
}

struct Home : View {
    
    @State var signUp = false
    @State var user = ""
    @State var pass = ""
    @State var rePass = ""
    
    var body: some View{
    
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            
            ZStack{
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    
                    Color("Color")
                        .clipShape(CShape())
                    
                    // adding another Curve...
                    
                    Path{path in
                        
                        // adding 40 for center...
                        
                        path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 120 , y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
                    }
                    .fill(Color.white)
                    
                    // adding Buttons...
                    
                    Button(action: {
                        
                        withAnimation(.easeIn){
                            
                            self.signUp = false
                        }
                        
                    }) {
                        
                        Image(systemName: signUp ? "xmark" : "person.fill")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color("Color"))
                    }
                    .offset(x: -110, y: -50)
                    // disabling Button When its not Use...
                    .disabled(signUp ? false : true)
                    
                    Button(action: {
                        
                        withAnimation(.easeOut){
                            
                            self.signUp = true
                        }
                        
                    }) {
                        
                        Image(systemName: signUp ? "person.badge.plus.fill" : "xmark")
                            .font(.system(size: signUp ? 26 : 25, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .offset(x: -30, y: -40)
                    .disabled(signUp ? true : false)
                }
                // Moving View Up...
                // Adjusting View For ipHone 8 Like Model....
                
                // Login View...
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Login")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Username")
                        .foregroundColor(.white)
                        .padding(.top,10)
                    
                    VStack{
                        
                        TextField("Useraname", text: $user)
                        
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    
                    Text("Password")
                        .foregroundColor(.white)
                        .padding(.top,10)
                    
                    VStack{
                        
                        SecureField("Paswword", text: $pass)
                        
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    
                    HStack{
                        
                        Spacer()
                        
                        // Login Button...
                        
                        Button(action: {}) {
                            
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color"))
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 25)
                .padding()
                
            }
            .offset(y: signUp ? -UIScreen.main.bounds.height + (UIScreen.main.bounds.height < 750 ? 100 : 130) : 0)
            .zIndex(1)
            // Moving View Front In Stack...
            
            // SignUp View...
            
            VStack(alignment: .leading, spacing: 25) {
                
                Text("Sign Up")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color("Color"))
                
                Text("Username")
                    .foregroundColor(Color("Color"))
                    .padding(.top,10)
                
                VStack{
                    
                    TextField("Useraname", text: $user)
                    
                    Divider()
                        .background(Color("Color").opacity(0.5))
                }
                
                Text("Password")
                    .foregroundColor(Color("Color"))
                    .padding(.top,10)
                
                VStack{
                    
                    SecureField("Paswword", text: $pass)
                    
                    Divider()
                        .background(Color("Color").opacity(0.5))
                }
                
                Text("Re-Enter")
                    .foregroundColor(Color("Color"))
                    .padding(.top,10)
                
                // use separate txt field Bindings here....
                
                VStack{
                    
                    SecureField("Re-Enter", text: $rePass)
                    
                    Divider()
                        .background(Color("Color").opacity(0.5))
                }
                
                HStack{
                    
                    Spacer()
                    
                    // Login Button...
                    
                    Button(action: {}) {
                        
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal,45)
                            .background(Color("Color"))
                            .clipShape(Capsule())
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                Spacer(minLength: 0)
            }
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 50)
            .padding()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        // changing user Interface Style...
        .preferredColorScheme(signUp ? .light : .dark)
    }
}

// custom Shape...

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {

        return Path{path in
            
            // starting from bottom...
            
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 50))
            
            // adding curve...
            
            // total raidus of curve = 80
            path.addArc(center: CGPoint(x: rect.width - 40, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}
