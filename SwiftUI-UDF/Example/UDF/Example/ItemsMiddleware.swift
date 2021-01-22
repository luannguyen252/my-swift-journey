//
//  ItemsMiddleware.swift
//  UDF
//
//  Created by Max Kuznetsov on 06.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI_UDF

struct ItemsMiddleware: Middleware {
    var store: AppStore
    var queue = DispatchQueue(label: "ItemsMiddleware")
    
    @Boxed private var cancellable: AnyCancellable? = nil
    
    var asObserver: Observer<AppState> {
        Observer(queue: queue) { state in
            self.observe(state: state)
            return state.allItems.byId.isEmpty ? .active : .dead
        }
    }
    
    func observe(state: AppState) {
        guard cancellable == nil else {
            return
        }
        
        switch state.allItemsFlow {
        case .loading:
            self.cancellable = LoadItemsEffect(queue: queue, id: ItemsFlow.id).upstream().sink { action in
                self.cancellable = nil
                self.store.dispatch(action: action)
            }
            
        default:
            break
        }
    }
}

struct LoadItemsEffect<Id: Hashable>: Effect {
    let queue: DispatchQueue
    let id: Id
    
    init(queue: DispatchQueue = DispatchQueue(label: "Load items queue"), id: Id) {
        self.queue = queue
        self.id = id
    }
    
    func upstream() -> AnyPublisher<AnyAction, Never> {
        let items = [
            Item(id: .init(value: 1)),
            Item(id: .init(value: 2)),
            Item(id: .init(value: 3)),
            Item(id: .init(value: 4)),
            Item(id: .init(value: 5))
        ]
        
        let group = ActionGroup(
            anyActions: [
                AnyAction(AnyAction.DidLoadItems(items: items, id: id)),
                AnyAction(AnyAction.UpdateUserInfo(userName: "Some user data"))
            ]
        )
        
        return Just(group.eraseToAnyAction())
            .receive(on: queue)
            .delay(for: 3, scheduler: queue)
            .eraseToAnyPublisher()
    }
}
