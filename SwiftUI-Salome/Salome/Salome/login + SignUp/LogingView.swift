//
//  LogingView.swift
//  People
//
//  Created by App Designer2 on 17.07.20.
//

import SwiftUI
import LocalAuthentication

struct FaceIDView: View {
    @State var email = ""
    @AppStorage("user") var user = "designer2@gmail.com"
    @AppStorage("logged") var logged = false
    var body: some View {
        VStack {
            if logged {
                ContentView()
                    
            } else {
                MainView()
                    .preferredColorScheme(.light)
                    .navigationBarHidden(true)
            }
        
    }
    }
}

struct FaceIDView_Previews: PreviewProvider {
    static var previews: some View {
        FaceIDView()
    }
}


struct MainView: View {
    @State var email = ""
    @AppStorage("user") var user = "designer2@gmail.com"
    @AppStorage("Logged") var logged = false
    var body: some View {
        VStack {
            TextField("Email...", text: self.$email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            if getBiometricsStatus() {
            Button(action: {
                authenticateUser()
                self.logged.toggle()
            }) {
                Image(systemName: LAContext().biometryType == .faceID ? "faceid": "touchid")
                    .font(.title)
                    .foregroundColor(LAContext().biometryType == .faceID ? .orange : .green)
                    .padding()
                    //.background(Color.init(#colorLiteral(red: 0.4092355371, green: 0.9824492335, blue: 0.5715798736, alpha: 1)))
                    .clipShape(Circle())
            }
            }
            
        }.padding()
    }
    func getBiometricsStatus()-> Bool {
        let scanner = LAContext()
        
        if email == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            
            return true
        }
        return false
    }
    
    func authenticateUser() {
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Unluck") { (status, err) in
            if err != nil {
            print(err!.localizedDescription)
            return
            }
            withAnimation(.easeOut) {logged = true}
        }
        
    }
}
class User : ObservableObject {
    @Published var user : String = UserDefaults.standard.string(forKey: "user")! {
        didSet {
            UserDefaults.standard.set(self.user, forKey: "user")
        }
    }
}
