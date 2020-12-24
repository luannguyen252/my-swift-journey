//
//  MenuSelectionView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct MenuSelectionView: View {
    // MARK: - PROPERTIES
    @ObservedObject var dragDrop: UserDragDrop
    public var viewSpace: Namespace.ID
    
    // MARK: - BODY
    var body: some View {
        HStack {
            // We need to know the rect positon of this 2 view
            GeometryReader { geo in
                MenuItemView(imageName: "creditcard.fill", title: "Payment", didEntered: dragDrop.dragDropConfig.isEnteredPayment)
                    .matchedGeometryEffect(id: "ViewID", in: viewSpace)
                    .onAppear {
                        dragDrop.paymentViewRect = geo.frame(in: .global)
                    }
            } //: GEOMETRY READER

            GeometryReader { geo in
                MenuItemView(imageName: "dollarsign.circle", title: "Collect Money", didEntered: dragDrop.dragDropConfig.isEnteredCollect)
                    .onAppear {
                        dragDrop.collectViewRect = geo.frame(in: .global)
                    }
            } //: GEOMETRY READER
        }
        .frame(height: 150)
    }
}
