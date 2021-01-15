//
//  SignUpView.swift
//  People
//
//  Created by App Designer2 on 18.07.20.
//

import SwiftUI

/*struct SignUpView: View {
    @AppStorage("email") var email = ""
    
    @AppStorage("pass") var pass = ""
    
    @ObservedObject var login = Nael()
    @AppStorage("perfil") var perfil : Data = .init(count: 0)
    
    @EnvironmentObject var signup : SignUp
    
    //Start profile
    @State var pPicker = false
    
    @AppStorage("image") var image : Data = .init(count: 0)
    //End profile
    
    @ObservedObject public var chooce = SchemeMode()
    var body: some View {
        ZStack {
            Rectangle()
                .fill(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                if self.perfil.count != 0  {
                    
                    Image(uiImage: UIImage(data: self.perfil)!)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                        .overlay(Circle().stroke(Color.white.opacity(0.60),lineWidth: 2))
                        //lightShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                        
                        //darkShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                    
                } else {
                    Button(action: {
                        self.pPicker.toggle()
                    }) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 70, height: 70)
                        .overlay(Circle().stroke(Color.gray,lineWidth: 2))
                        //.overlay(Circle().stroke(Color.init("darkShadow"),lineWidth: 2))
                        
                        //lightShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                        
                        //darkShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                    }
                }
                
                VStack(alignment: .leading, spacing: 18) {
                    TextField("Email...", text: self.$email)
                        .padding()
                        .background(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                        
                        .allowsHitTesting(true)
                        .cornerRadius(16)
                        
                        //lightShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                        
                        //darkShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                    
                    //Password
                    SecureField("Password...", text: self.$pass)
                        .padding()
                        .background(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                        
                        .allowsHitTesting(true)
                        .cornerRadius(16)
                        
                        //lightShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                        
                        //darkShadow
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                }.padding()
                
                
                Button(action: {
                    self.signup.isTrue.toggle()
                    
                    self.signup.email.append(self.email)
                    self.signup.password.append(self.pass)
                    self.signup.perfil.append(self.perfil)
                }) {
                    Text("SignUp").bold()
                        .italic()
                        .padding()
                        .foregroundColor(self.email.count > 5 && self.pass.count > 6 ? .black : .gray)
                }.frame(width: 150, height: 20)
                .padding()
                .background(self.email.count > 5 && self.pass.count > 6 && self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                .cornerRadius(16)
                //lightShadow
                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                //darkShadow
                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                .disabled(self.email.count > 5 && self.pass.count > 6 && self.perfil.count != 0 ? false : true)
                    
            }
            if self.email == self.signup.email && self.pass == self.signup.password && self.signup.isTrue == true {
                
                LogingView()
            } else {
                
            }//Else
            
        }.preferredColorScheme(self.chooce.chooce ? .light : .dark)
        .sheet(isPresented: self.$pPicker) {
            ProfilePicker(pPicker: self.$pPicker, profilePicker: self.$perfil)
        }
    }
    /*func resgister(email: String, pass: String,repeatPass: String) {
            if email == self.register.email  && self.pass == self.register.pass {
                self.register.email.append(email)
                    
            }
        
    }*/
}

 struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(SignUp())
    }
}*/



