//
//  ContentView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @ObservedObject var dragDrop = UserDragDrop()
    @Namespace private var viewSpace
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                TopBarView()
                
                Spacer()
                
                CardView()
                    .padding(.top, 30)

                RecentlyTradedView(dragDrop: dragDrop, viewSpace: viewSpace)
                    .padding(.top, 20)

            } //: VSTACK
            .padding(.horizontal)
            .padding(.top, 80)
            
            if dragDrop.dragDropConfig.isDroppedOnPayment {
                // Need to show the payment view lets do with matched geometry animation
                PaymentView(viewSpace: viewSpace, dragDrop: dragDrop)
            }
            
            if dragDrop.dragDropConfig.isDroppedOnCollect {
                // Need to show the collect view
            }
        } //: ZSTACK
        .background(Color.background)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
