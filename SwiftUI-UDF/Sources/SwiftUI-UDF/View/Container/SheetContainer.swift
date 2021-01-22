//
//  SheetContainer.swift
//  
//
//  Created by Max Kuznetsov on 06.11.2020.
//

import SwiftUI

public extension View {
    
    func sheetContainer<C: Container, V: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        container: C,
        transform: @escaping (C) -> V
    ) -> some View {
        
        self.modifier(
            SheetContainer(
                isPresented: isPresented,
                onDismiss: onDismiss,
                container: { container },
                transform: transform
            )
        )
    }
    
    func sheetContainer<C: Container, V: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        container: @escaping () -> C,
        transform: @escaping (C) -> V
        ) -> some View {
        
        self.modifier(
            SheetContainer(
                isPresented: isPresented,
                onDismiss: onDismiss,
                container: container,
                transform: transform
            )
        )
    }
    
    func sheetContainer<C: Container>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        container: @escaping () -> C
    ) -> some View {
        
        self.modifier(
            SheetContainer(
                isPresented: isPresented,
                onDismiss: onDismiss,
                container: container,
                transform: { $0 }
            )
        )
    }
    
    func sheetContainer<C: Container>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, container: C) -> some View {
        self.modifier(
            SheetContainer(
                isPresented: isPresented,
                onDismiss: onDismiss,
                container: { container },
                transform: { $0 }
            )
        )
    }
}

fileprivate struct SheetContainer<C: Container, V: View>: ViewModifier {
    @Binding var isPresented: Bool
    var onDismiss: (() -> Void)?
    var container: () -> C
    var transform: (C) -> V
    
    @EnvironmentObject var store: EnvironmentStore<C.State>
    
    public func body(content: Content) -> some View {
        content.sheet(isPresented: $isPresented, onDismiss: onDismiss) {
            transform(container()).environmentObject(store)
        }
    }
}
