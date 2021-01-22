//
//  LoginMiddleware.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI_UDF

struct LoginMiddleware: Middleware {
    var store: AppStore
    var queue = DispatchQueue(label: "LoginMiddleware")
    
    @Boxed var cancellable: AnyCancellable? = nil
    
    var asObserver: Observer<AppState> {
        Observer(queue: queue) { state in
            self.observe(state: state)
            if case .session = state.loginFlow {
                return .dead
            }
            return .active
        }
    }
    
    func observe(state: AppState) {
        guard cancellable == nil else {
            return
        }
        
        switch state.loginFlow {
        case .loading:
            self.cancellable = LoginEffect(queue: queue).upstream().sink { action in
                self.cancellable = nil
                self.store.dispatch(action: action)
            }

        default:
            break
        }
    }
}

struct LoginEffect: Effect {
    let queue: DispatchQueue
    
    init(queue: DispatchQueue = DispatchQueue(label: "Login queue")) {
        self.queue = queue
    }
    
    func upstream() -> AnyPublisher<AnyAction, Never> {
        Just(AnyAction.SignedIn().eraseToAnyAction())
            .receive(on: queue)
            .delay(for: 5, scheduler: queue)
            .eraseToAnyPublisher()
    }
}
