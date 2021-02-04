//
//  MockUserNameValidator.swift
//  LoginFormTDDTests
//
//  Created by Rohit Saini on 24/02/20.
//  Copyright © 2020 Saini. All rights reserved.
//

import Foundation
import XCTest

class MockUserNameValidator: UserNameValidator {

    private var expectation:XCTestExpectation?
    private var expectedValue:String?
    
    init(_ expectation:XCTestExpectation, expectedValue:String) {
        self.expectation = expectation
        self.expectedValue = expectedValue
        super.init()
    }
    
    override func validate(_ value:String) -> Bool {
        
        if let expectation = self.expectation,
            let expectedValue = self.expectedValue {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        return super.validate(value)
    }

    
}
