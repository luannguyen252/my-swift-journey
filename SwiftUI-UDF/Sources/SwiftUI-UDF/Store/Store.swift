//
//  Store.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation

public final class Store<State> {
    public typealias Reducer = (inout State, AnyAction) -> ()
    private let queue = DispatchQueue(label: "Store queue", qos: .userInitiated)
    
    public init(initial state: State, reducer: @escaping Reducer) {
        self.reducer = reducer
        self.state = state
    }
    
    public let reducer: Reducer
    public private(set) var state: State
    
    public func dispatch<Action: Actionable>(
        action: Action,
        fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line) where Action: Equatable
    {
        self.dispatch(
            action: action.eraseToAnyAction(
                fileName: fileName,
                functionName: functionName,
                lineNumber: lineNumber
            )
        )
    }
    
    public func dispatch(action: AnyAction) {
        queue.async {
            if let group = action.value as? ActionGroup {
                group.actions.forEach {
                    self.reducer(&self.state, $0)
                }
                
            } else {
                self.reducer(&self.state, action)
            }
            
            self.observers.forEach(self.notify)
        }
    }
    
    private var observers: Set<Observer<State>> = []
    
    public func subscribe(observer: Observer<State>) {
        queue.async {
            self.observers.insert(observer)
            self.notify(observer)
        }
    }
    
    private func notify(_ observer: Observer<State>) {
        let status = observer.queue.sync {
            observer.observe(state)
        }
        
        if case .dead = status {
            observers.remove(observer)
        }
    }
}
