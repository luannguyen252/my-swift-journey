//
//  Actionable.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation

public protocol Actionable {}

public extension Actionable where Self: Equatable {
    func eraseToAnyAction(fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) -> AnyAction {
        AnyAction(self, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
}
