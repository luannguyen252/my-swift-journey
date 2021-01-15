//
//  GlobalData.swift
//  Salome
//
//  Created by App Designer2 on 17.08.20.
//

import Foundation
import SwiftUI
import NaturalLanguage
import Combine



class GlobalData : ObservableObject {

    @Published public var image : [UIImage] = []
    
}

//Start Login
class Login : ObservableObject {
    @Published var isLoged = false
    @Published var pickerPer = false
    @Published public var perfil : Data = .init(count: 0)
    
    @Published public var email : String = UserDefaults.standard.string(forKey: "email") ?? "" {
        didSet {
            UserDefaults.standard.set(self.email, forKey: "email")
        }
    }
    
    @Published public var password : String = UserDefaults.standard.string(forKey: "password") ?? "" {
        didSet {
            UserDefaults.standard.set(self.password, forKey: "password")
        }
    }
    
}
//End Login

//Start SignUp
class SignUp : ObservableObject {
    @Published public var perfil : Data = .init(count: 0)
    @Published public var pickerPer = false
    @Published public var isTrue = false
    
    @Published public var email : String = "" /*UserDefaults.standard.string(forKey: "email") ?? "" {
        didSet {
            UserDefaults.standard.set(self.email, forKey: "email")
        }
    }*/
    
    @Published public var password : String = "" /*UserDefaults.standard.string(forKey: "password") ?? "" {
        didSet {
            UserDefaults.standard.set(self.password, forKey: "password")
        }
    }*/
    
    @Published public var repeatPassword : String = "" /*UserDefaults.standard.string(forKey: "repeatPassword") ?? "" {
        didSet {
            UserDefaults.standard.set(self.repeatPassword, forKey: "repeatPassword")
        }
    }*/
}
//End SignUp
