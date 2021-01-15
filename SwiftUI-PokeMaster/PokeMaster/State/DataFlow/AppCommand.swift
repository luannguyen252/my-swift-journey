//
//  AppCommand.swift
//  PokeMaster
//
//  Created by huhsx on 2020/7/31.
//  Copyright © 2020 huhsx. All rights reserved.
//

import Foundation
import Combine

protocol AppCommand {
    func execute(in store: Store)
}

struct LoginAppCommand: AppCommand {
    
    let email: String
    let password: String
    
    func execute(in store: Store) {
        
        let token = SubscriptionToken()
        
        LoginRequest(
            email: email,
            password: password
        ).publisher
            .sink(receiveCompletion: { (complete) in
                if case .failure(let error) = complete {
                    store.dispatch(.accountBehaviorDone(result: .failure(error)))
                }
                token.unseal()
            }) { user in
                store.dispatch(.accountBehaviorDone(result: .success(user)))
        }
        .seal(in: token)
    }
}

class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unseal() { cancellable = nil }
}

extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
