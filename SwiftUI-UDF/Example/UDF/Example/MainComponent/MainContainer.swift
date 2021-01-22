//
//  MainContainer.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI
import SwiftUI_UDF
import OrderedDictionary

struct MainContainer: Container {
    typealias ContainerComponent = MainComponent<ItemDetailsContainer>
    
    func map(state: AppState, store: AppEnvironmentStore) -> ContainerComponent.Props {
        .init(
            items: Array(state.allItems.byId.orderedKeys),
            itemDetails: { ItemDetailsContainer(id: $0) },
            itemById: { state.allItems.byId[$0]! }
        )
    }
    
    func onContainerAppear(store: EnvironmentStore<AppState>) {
        store.dispatch(AnyAction.LoadItems())
    }
}

struct MainContainer_Previews: PreviewProvider {
    static var previews: some View {
        MainContainer()
    }
}
