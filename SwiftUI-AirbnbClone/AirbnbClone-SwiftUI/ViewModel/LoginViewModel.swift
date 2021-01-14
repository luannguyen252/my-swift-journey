//
//  LoginViewModel.swift
//  AirbnbClone-SwiftUI
//
//  Created by Keerthi on 14/09/20.
//  Copyright © 2020 Hxtreme. All rights reserved.

import SwiftUI
import Combine

class LoginViewModel: ObservableObject, Identifiable {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    private var disposables: Set<AnyCancellable> = []

    var loginHandler = LoginHandler()
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        loginHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    let EMAIL = "email"
    let PASSWORD = "password"
    let IS_GMAIL_LOGIN = "is_gmail_login"
    
       
    init() {
        isLoadingPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &disposables)
    }
    
}

extension LoginViewModel {
    // MARK: - Validation
    
    func validateLoginEmptyField() -> Bool {
        return ((self.email).isEmpty || (self.password).isEmpty) ? true : false
    }
    
    func validateForgotPasswordEmptyField() -> Bool {
        return false
    }
    
    func isValidPassword(testStr: String) -> String? {
        if testStr.count <= 1 {
            return "Please, enter a password"
        }
        
        if testStr.count < 8 {
            return "Password must not be shorter than 8 characters"
        }
        return nil
    }
    
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
}
extension LoginViewModel {
    // MARK: - Service
    func callLoginService() {
           var parameters = [String : Any]()
           parameters[EMAIL] = email
           parameters[PASSWORD] = password
           parameters[IS_GMAIL_LOGIN] = false
           loginHandler.callLoginAPI(parameters: parameters)
       }
}
