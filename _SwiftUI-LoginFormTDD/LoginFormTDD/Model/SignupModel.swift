//
//  SignupModel.swift
//  LoginFormTDD
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation

class SignupModel: NSObject{
    var userName:String
    var password:String
    var emailAddress:String
    init?(userName: String,password: String,emailAddress: String,userNameValidator: UserNameValidator? = nil,passwordValidator: PasswordValidator? = nil,emailValidator: EmailValidator? = nil){
        
        let validator1 = userNameValidator ?? UserNameValidator()
        if validator1.validate(userName) == false{
            return nil
        }
        
        let validator2 = passwordValidator ?? PasswordValidator()
        if validator2.validate(password) == false{
            return nil
        }
        
        let validator3 = emailValidator ?? EmailValidator()
        if validator3.validate(emailAddress) == false{
            return nil
        }
        
        self.userName = userName
        self.password = password
        self.emailAddress = emailAddress
        super.init()
    }
}
