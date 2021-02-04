//
//  LoginViewModelTests.swift
//  LoginFormTDDTests
//
//  Created by MACBOOK on 19/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import XCTest

class LoginViewModelTests: XCTestCase {

    fileprivate var mockLoginViewController:MockLoginViewController?
    fileprivate var validUserName = "abcdefghij"
    fileprivate var invalidUserName = "a"
    fileprivate let validPassword = "D%io7AFn9Y"
    fileprivate let invalidPassword = "a3$Am"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockLoginViewController = MockLoginViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_ValidView_InstantiatesObject(){
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        if let lhs = mockLoginViewController ,let rhs = viewModel.view as? MockLoginViewController{
            XCTAssertTrue(lhs === rhs)
        }
    }
    
    
}

// MARK: performInitialViewSetup tests
extension LoginViewModelTests {
    func testPerformInitialViewSetup_Calls_ClearUserNameField_OnViewController() {
        let expectation = self.expectation(description: "expected clearUserNameField() to be called")
        mockLoginViewController!.expectationForClearUserNameField = expectation
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.performInitialViewSetup()
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testPerformInitialViewSetup_Calls_ClearPasswordField_OnViewController() {
        let expectation = self.expectation(description: "expected clearPasswordField() to be called")
        mockLoginViewController!.expectationForClearPasswordField = expectation
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.performInitialViewSetup()
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    func testPerformInitialViewSetup_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLoginButton(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.performInitialViewSetup()
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    func testPerformInitialViewSetup_EnablesCreateAccountButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateAccountButton(true) to be called")
        mockLoginViewController!.expectationForCreateAccountButton = (expectation, true)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.performInitialViewSetup()
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
}


// MARK: userNameDidEndOnExit tests
extension LoginViewModelTests {
    
    func testUserNameDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockLoginViewController!.expectationForHideKeyboard = expectation
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.userNameDidEndOnExit()
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
}


// MARK: passwordDidEndOnExit tests
extension LoginViewModelTests {
func testPasswordDidEndOnExit_Calls_HideKeyboard_OnViewController() {
    let expectation = self.expectation(description: "expected hideKeyboard() to be called")
    mockLoginViewController!.expectationForHideKeyboard = expectation
let viewModel = LoginViewModel(view:mockLoginViewController!)
    viewModel.passwordDidEndOnExit()
self.waitForExpectations(timeout: 1.0, handler: nil) }
}

// MARK: userNameUpdated tests
extension LoginViewModelTests {
    func testUserNameUpdated_Calls_Validate_OnUserNameValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.userNameValidator = MockUserNameValidator(expectation, expectedValue: validUserName)
        viewModel.userNameUpdated(validUserName)
        self.waitForExpectations(timeout: 1.0, handler: nil) }
    func testUserNameUpdated_ValidUserName_PasswordValidated_EnablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, true)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.passwordValidated = true
        viewModel.userNameUpdated(validUserName)
        self.waitForExpectations(timeout: 1.0, handler: nil) }
    func testUserNameUpdated_ValidUserName_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.passwordValidated = false
        viewModel.userNameUpdated(validUserName)
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    func testUserNameUpdated_InvalidUserName_PasswordValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.passwordValidated = true
        
        viewModel.userNameUpdated(invalidUserName)
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    func testUserNameUpdated_InvalidUserName_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.passwordValidated = false
        viewModel.userNameUpdated(invalidUserName)
        self.waitForExpectations(timeout: 1.0, handler: nil) }
}


// MARK: passwordUpdated tests
extension LoginViewModelTests {
    func testPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        viewModel.passwordUpdated(validPassword)
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    func testPasswordUpdated_ValidPassword_UserNameValidated_EnablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, true)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.userNameValidated = true
        viewModel.passwordUpdated(validPassword)
        self.waitForExpectations(timeout: 1.0, handler: nil) }
    func testPasswordUpdated_ValidPassword_UserNameNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.userNameValidated = false
        viewModel.passwordUpdated(validPassword)
        self.waitForExpectations(timeout: 1.0, handler: nil) }
    func testPasswordUpdated_InvalidPassword_UserNameValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.userNameValidated = true
        viewModel.passwordUpdated(invalidPassword)
        self.waitForExpectations(timeout: 1.0, handler: nil) }
    
    func testPasswordUpdated_InvalidPassword_UserNameNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.userNameValidated = false
        viewModel.passwordUpdated(invalidPassword)
        self.waitForExpectations(timeout: 1.0, handler: nil) }
}
