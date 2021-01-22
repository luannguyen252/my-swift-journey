//
//  File.swift
//  
//
//  Created by Max Kuznetsov on 23.06.2020.
//

import Foundation

public struct AnyAction {
    public let value: Actionable
    
    private let anyValue: Any
    private let equalTo: (Any) -> Bool
    private let actionDescription: String
    
    public init<T: Actionable>(_ value: T, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) where T: Equatable {
        self.value = value
        self.anyValue = value
        self.equalTo = { $0 as? T == value }
        
        let fileURL = NSURL(fileURLWithPath: fileName).lastPathComponent ?? "Unknown file"
        actionDescription = "\(String(describing: value)) from \(fileURL) - \(functionName) at line \(lineNumber)"
    }
}

// MARK: - Equatable
extension AnyAction: Equatable {
    public static func == (lhs: AnyAction, rhs: AnyAction) -> Bool {
        lhs.equalTo(rhs.anyValue)
    }
}

// MARK: - CustomDebugStringConvertible
extension AnyAction: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        actionDescription
    }
}
