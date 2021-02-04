//
//  LoginViewModel.swift
//  LoginFormTDD
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation

class LoginViewModel: NSObject{
    weak var view: LoginViewControllerProtocol?
    var userNameValidator:UserNameValidator?
    var passwordValidator:PasswordValidator?
    var userNameValidated:Bool
    var passwordValidated:Bool
    
    
    init(view:LoginViewControllerProtocol) {
        self.userNameValidated = false
        self.passwordValidated = false
        super.init()
        self.view = view
        
    }
    func userNameDidEndOnExit() {
        view?.hideKeyboard()
    }
    func passwordDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func performInitialViewSetup() {
        view?.clearUserNameField()
        view?.clearPasswordField()
        view?.enableLoginButton(false)
        view?.enableCreateAccountButton(true)
    }
    
    
    func userNameUpdated(_ value:String?) {
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        let validator = self.userNameValidator ?? UserNameValidator()
        userNameValidated = validator.validate(value)
        if userNameValidated == false {
            view?.enableLoginButton(false)
            return
        }
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        view?.enableLoginButton(true)
        
    }
    
    func passwordUpdated(_ value:String?) {
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        let validator = self.passwordValidator ?? PasswordValidator()
        passwordValidated = validator.validate(value)
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        if userNameValidated == false {
            view?.enableLoginButton(false)
            return
        }
        view?.enableLoginButton(true)
        
    }
}
