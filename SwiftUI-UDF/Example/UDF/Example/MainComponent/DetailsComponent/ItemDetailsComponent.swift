//
//  ItemDetailsComponent.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI
import SwiftUI_UDF

struct ItemDetailsComponent: Component {
    struct Props {
        var value: Int
        var isFavorite: Binding<Bool>
    }
    
    var props: Props
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Item value - \(props.value)")
                
                Button(action: { self.props.isFavorite.wrappedValue.toggle() }) {
                    Image(systemName: props.isFavorite.wrappedValue ? "star.fill" : "star")
                }
            }
        }
    }
}
