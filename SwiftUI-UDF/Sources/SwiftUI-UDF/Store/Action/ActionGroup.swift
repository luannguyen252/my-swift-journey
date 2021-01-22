//
//  File.swift
//  
//
//  Created by Max Kuznetsov on 02.12.2020.
//

import Foundation

public struct ActionGroup: Actionable, Equatable {
    public var actions: [AnyAction]
    
    public init<T: Actionable & Equatable>(
        action: T,
        fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line
    ) {
        actions = [
            AnyAction(
                action,
                fileName: fileName,
                functionName: functionName,
                lineNumber: lineNumber
            )
        ]
    }
    
    public init<T: Actionable & Equatable>(
        actions: [T],
        fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line
    ) {
        self.actions = actions.map {
            $0.eraseToAnyAction(
                fileName: fileName,
                functionName: functionName,
                lineNumber: lineNumber
            )
        }
    }
    
    public init(anyActions: [AnyAction]) {
        self.actions = anyActions
    }
    
    public init() {
        actions = []
    }
}

// MARK: - Append Actions
extension ActionGroup {
    
    public mutating func append<T: Actionable & Equatable>(
        action: T,
        fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line
    ) {
        actions.append(action.eraseToAnyAction(
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber
        ))
    }
    
    public mutating func append(action: AnyAction) {
        actions.append(action)
    }
}
