//
//  EmptyContainer.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI

public struct RenderContainer<V: View>: Container {
    public typealias ContainerComponent = RenderComponent<V>
    
    public var viewToRender: V
    
    public init(viewToRender: V) {
        self.viewToRender = viewToRender
    }
        
    public func map(state: Void, store: EnvironmentStore<Void>) -> ContainerComponent.Props {
        .init(view: viewToRender)
    }
    
    public var body: some View {
        viewToRender
    }
}

public struct RenderComponent<V: View>: Component {
    public struct Props {
        var view: V
    }
    
    public var props: Props
    
    public init(props: Props) {
        self.props = props
    }
    
    public var body: some View {
        props.view
    }
}
