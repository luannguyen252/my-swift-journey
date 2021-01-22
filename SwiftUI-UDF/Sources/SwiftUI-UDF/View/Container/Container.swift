//
//  Container.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI

public protocol Container: View {
    associatedtype State
    associatedtype ContainerComponent: Component
    
    func map(state: State, store: EnvironmentStore<State>) -> ContainerComponent.Props
    
    func onContainerAppear(store: EnvironmentStore<State>)
    func onContainerDisappear(store: EnvironmentStore<State>)
}

public extension Container {
    func onContainerAppear(store: EnvironmentStore<State>) {}
    func onContainerDisappear(store: EnvironmentStore<State>) {}
}

public extension Container {
    
    var body: some View {
        connectedContainer()
    }
    
    @ViewBuilder
    private func connectedContainer() -> some View {
        if #available(iOS 14, *) {
            ConnectedContainer<ContainerComponent, State>(
                map: map,
                onContainerAppear: onContainerAppear,
                onContainerDisappear: onContainerDisappear
            )
        } else {
            ConnectedContainerIOS13<ContainerComponent, State>(
                map: map,
                onContainerAppear: onContainerAppear,
                onContainerDisappear: onContainerDisappear
            )
        }
    }
}

@available(iOS 14, *)
fileprivate struct ConnectedContainer<C: Component, State>: View {
    @EnvironmentObject var store: EnvironmentStore<State>
    
    let map: (_ state: State, _ store: EnvironmentStore<State>) -> C.Props
    
    var onContainerAppear: (EnvironmentStore<State>) -> Void
    var onContainerDisappear: (EnvironmentStore<State>) -> Void
    
    var body: some View {
        C(props: map(store.state, store))
            .onAppear { onContainerAppear(store) }
            .onDisappear { onContainerDisappear(store) }
    }
}

// iOS 13 is losing the Environment object in some cases, so we need to cover cases when the store is nil.
fileprivate struct ConnectedContainerIOS13<C: Component, State>: View {
    @EnvironmentObject var store: EnvironmentStore<State>
    
    let map: (_ state: State, _ store: EnvironmentStore<State>) -> C.Props
    
    var onContainerAppear: (EnvironmentStore<State>) -> Void
    var onContainerDisappear: (EnvironmentStore<State>) -> Void
        
    var body: some View {
        if _store.hasValue {
            CachedStore.store = store
        }
        let currentStore = _store.hasValue ? store : CachedStore.store as! EnvironmentStore<State>
    
        return C(props: map(currentStore.state, currentStore))
            .onAppear { onContainerAppear(store) }
            .onDisappear { onContainerDisappear(store) }
    }
}

fileprivate extension EnvironmentObject {
    var hasValue: Bool {
        !String(describing: self).contains("_store: nil")
    }
}

fileprivate enum CachedStore {
    static var store: Any!
}

