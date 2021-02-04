//
//  LoginViewControllerProtocol.swift
//  LoginFormTDD
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol: class{
    func clearUserNameField()
    func clearPasswordField()
    func enableLoginButton(_ status:Bool)
    func enableCreateAccountButton(_ status:Bool)
    func hideKeyboard()
}
