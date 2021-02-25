//
//  MenuSelectionView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct MenuSelectionView: View {
    @ObservedObject var dragDrop: UserDragDrop
    public var viewSpace: Namespace.ID
    var body: some View {
        HStack {
            //we need to know the rect positon of this 2 view
            GeometryReader { geo in
                MenuItemView(imageName: "creditcard.fill", title: "Payment", didEntered: dragDrop.dragDropConfig.isEnteredPayment)
                    .matchedGeometryEffect(id: "ViewID", in: viewSpace)
                    .onAppear {
                        dragDrop.paymentViewRect = geo.frame(in: .global)
                    }
            }

            GeometryReader { geo in
                MenuItemView(imageName: "dollarsign.circle", title: "Collect Money", didEntered: dragDrop.dragDropConfig.isEnteredCollect)
                    .onAppear {
                        dragDrop.collectViewRect = geo.frame(in: .global)
                    }
            }
            
        }
        .frame(height: 150)
    }
}
