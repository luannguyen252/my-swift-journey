//
//  MockLoginViewController.swift
//  LoginFormTDDTests
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation
import XCTest
class MockLoginViewController: LoginViewControllerProtocol{
    
    var expectationForClearUserNameField:XCTestExpectation?
    var expectationForClearPasswordField:XCTestExpectation?
    var expectationForEnableLoginButton:(XCTestExpectation, Bool)?
    var expectationForCreateAccountButton:(XCTestExpectation, Bool)?
    var expectationForHideKeyboard:XCTestExpectation?
    
    func clearUserNameField() {
        self.expectationForClearUserNameField?.fulfill()
    }
    func clearPasswordField() {
        self.expectationForClearPasswordField?.fulfill()
    }
    func enableLoginButton(_ status:Bool) {
        if let (expectation, expectedValue) = self.expectationForEnableLoginButton {
            if status == expectedValue {
                expectation.fulfill()
            }
            
        }
    }
    func enableCreateAccountButton(_ status:Bool) {
        if let (expectation, expectedValue) = self.expectationForCreateAccountButton {
            if status == expectedValue {
                expectation.fulfill()
            }
            
        }
    }
    
    func hideKeyboard() {
        self.expectationForHideKeyboard?.fulfill()
    }

    
}
