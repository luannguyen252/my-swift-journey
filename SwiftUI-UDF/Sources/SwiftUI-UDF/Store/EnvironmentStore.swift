//
//  EnvironmentStore.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI

public typealias Command = () -> ()
public typealias CommandWith<T> = (T) -> ()

public class EnvironmentStore<State>: ObservableObject {
    public let store: Store<State>
    
    @Published public private(set) var state: State
    
    public init(store: Store<State>) {
        self.store = store
        self.state = store.state
        
        store.subscribe(observer: asObserver)
    }
    
    private var asObserver: Observer<State> {
        Observer(queue: .main) { state in
            self.state = state
            return .active
        }
    }
    
    public func dispatch<Action: Actionable>(
        _ action: Action,
        fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line) where Action: Equatable
    {
        dispatch(action.eraseToAnyAction(
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber
        ))
    }
    
    public func dispatch(_ action: AnyAction) {
        store.dispatch(action: action)
    }
    
    public func bind(_ action: AnyAction) -> Command {
        return {
            self.dispatch(action)
        }
    }
    
    public func bind<Action: Actionable>(
        _ action: Action,
        fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line
    ) -> Command where Action: Equatable {
        bind(action.eraseToAnyAction(
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber
        ))
    }
    
    public func bind<T>(_ action: @escaping (T) -> AnyAction) -> CommandWith<T> {
        return { value in
            self.dispatch(action(value))
        }
    }
    
    public func bind<Action: Actionable, T>(
        _ action: @escaping (T) -> Action,
        fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line
    ) -> CommandWith<T> where Action: Equatable {
        return { value in
            self.dispatch(action(value).eraseToAnyAction(
                fileName: fileName,
                functionName: functionName,
                lineNumber: lineNumber
            ))
        }
    }
}
