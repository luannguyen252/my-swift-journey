//
//  SwiftUIDemoSmazakTests.swift
//  SwiftUIDemoSmazakTests
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import XCTest

final class SwiftUIDemoSmazakTests: XCTestCase {
    func testStructRetainCycle() {
        var testStruct: TestStruct? = TestStruct()
        var pointer: UnsafePointer<TestClass>? = nil
        withUnsafePointer(to: testStruct!.testClass) { (unsafePointer) in
            pointer = unsafePointer
        }
        testStruct?.makeRetainCycle()
        testStruct = nil
        
        XCTAssertNotNil(pointer?.pointee)
    }
    
    func testClassRetainCycle() {
        var testClass: TestClass? = TestClass()
        testClass?.makeRetainCycle()
        weak var copyReference = testClass
        testClass = nil
        XCTAssertNotNil(copyReference)
    }
}

fileprivate struct MakeReatainCycleStruct {
    func closure(completion: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            completion()
        }
    }
}

fileprivate struct TestStruct {
    let testClass = TestClass()
    private let makeRetainCycleStruct = MakeReatainCycleStruct()
    
    private func printFoo() {
        print(testClass.foo)
    }
    
    func makeRetainCycle() {
        makeRetainCycleStruct.closure {
            self.printFoo()
        }
    }
}

fileprivate final class TestClass {
    let foo = "foo"
    let makeRetainCycleStruct = MakeReatainCycleStruct()
    
    private func printFoo() {
        print(foo)
    }
    
    func makeRetainCycle() {
        makeRetainCycleStruct.closure {
            self.printFoo()
        }
    }
}
