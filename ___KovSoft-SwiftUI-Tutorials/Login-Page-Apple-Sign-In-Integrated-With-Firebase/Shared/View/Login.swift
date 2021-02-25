//
//  Login.swift
//  Apple_Signin (iOS)
//
//  Created by Balaji on 19/02/21.
//

import SwiftUI
import AuthenticationServices

struct Login: View {
    
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        
        ZStack{
            
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.35))
                .ignoresSafeArea()
            
            VStack(spacing: 25){
                
                Text("Unspalsh")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 30, content: {
                    
                    Text("Largest\nImages Library")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("The internet's source of freely-usable images. Powered by creators everywhere for you.")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                })
                .padding(.horizontal,30)
                
                Spacer()
                
                // Login Button....
                
                SignInWithAppleButton { (request) in
                    
                    // requesting paramertes from apple login...
                    loginData.nonce = randomNonceString()
                    request.requestedScopes = [.email,.fullName]
                    request.nonce = sha256(loginData.nonce)
                    
                } onCompletion: { (result) in
                    
                    // getting error or success...
                    
                    switch result{
                    case .success(let user):
                        print("success")
                        // do Login With Firebase...
                        guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                            print("error with firebase")
                            return
                        }
                        loginData.authenticate(credential: credential)
                    case.failure(let error):
                        print(error.localizedDescription)
                    }
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .clipShape(Capsule())
                .padding(.horizontal,40)
                .offset(y: -70)

            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
