//
//  LoginViewModel.swift
//  Login_Face_ID
//
//  Created by Balaji on 07/10/20.
//

import SwiftUI
import LocalAuthentication
import Firebase

class LoginViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    // For Alerts..
    @Published var alert = false
    @Published var alertMsg = ""
    
    // User Data....
    
    @AppStorage("stored_User") var Stored_User = ""
    
    @AppStorage("stored_Password") var Stored_Password = ""
    
    @AppStorage("status") var logged = false
    
    @Published var store_Info = false
    
    // Loading Screen...
    @Published var isLoading = false
    
    // Getting BioMetricType....
    
    func getBioMetricStatus()->Bool{
        
        let scanner = LAContext()
        if email != "" && email == Stored_User && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none){
            
            return true
        }
        
        return false
    }
    
    // authenticate User...
    
    func authenticateUser(){
        
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Unlock \(email)") { (status, err) in
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            
            // Settig User Password And Logging IN...
            DispatchQueue.main.async {
                self.password = self.Stored_Password
                self.verifyUser()
            }
        }
    }
    
    // Verifying User...
    
    func verifyUser(){
        
        isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            
            self.isLoading = false
            
            if let error = err{
                self.alertMsg = error.localizedDescription
                self.alert.toggle()
                return
            }
            
            // Success
            
            // Promoting User For Save data or not...
            
            if self.Stored_User == "" || self.Stored_Password == ""{
                self.store_Info.toggle()
                return
            }
            
            // Else Goto Home...
            
            withAnimation{self.logged = true}
        }
    }
}
