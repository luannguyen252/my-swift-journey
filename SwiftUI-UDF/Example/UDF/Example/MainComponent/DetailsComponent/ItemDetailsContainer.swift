//
//  ItemDetailsContainer.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF

struct ItemDetailsContainer: Container {
    typealias ContainerComponent = ItemDetailsComponent
    
    let id: Item.Id
    
    func map(state: AppState, store: EnvironmentStore<AppState>) -> ContainerComponent.Props {
        .init(
            value: item(state).value,
            isFavorite: .constant(false)
        )
    }
    
    func item(_ state: AppState) -> Item {
        guard let item = state.allItems.byId[id] else {
            preconditionFailure()
        }
        
        return item
    }
}
