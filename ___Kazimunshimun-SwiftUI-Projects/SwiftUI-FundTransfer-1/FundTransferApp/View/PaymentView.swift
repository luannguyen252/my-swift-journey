//
//  PaymentView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct PaymentView: View {
    public var viewSpace: Namespace.ID
    @ObservedObject var dragDrop: UserDragDrop
    @ObservedObject var input =  PaymentInput()
    
    @State var config = PaymentViewConfig()
    
    var body: some View {
        ZStack {
            Rectangle()
                .onTapGesture {
                    withAnimation {
                        dragDrop.dragDropConfig.isDroppedOnPayment = false
                    }
                }
            
            VStack {
                Spacer(minLength: config.topPadding/2)
                
                CreditCardView(showCreditCard: $config.showCreditCard)
                
                Spacer(minLength: config.topPadding/2)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.background)
                    .matchedGeometryEffect(id: "ViewID", in: viewSpace)
            }
            
            
            VStack(spacing: 20) {
                Spacer(minLength: config.showCreditCard ? 290 : 120)
                
                UserViewForDrag(user: dragDrop.pickedUser, width: 100)
                    .scaleEffect(config.startAnimation ? 1.0 : 0.0)
                
                Text("Transfer to ") + Text("\(dragDrop.pickedUser.name)").fontWeight(.heavy)
                
                HStack {
                    Text("$")
                    Text(input.amount)
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 3, height: 45)
                        .opacity(config.blink ? 0.0 : 1.0)
                        .opacity(config.showCreditCard ? 0.0 : 1.0)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 0.7).repeatForever()) {
                                config.blink.toggle()
                            }
                        }
                }
                .font(.system(size: 48, weight: .black))
                
                Spacer()
                
                PaymentCompletionView(config: $config, dragDrop: dragDrop)
                
                DescriptionView()
                    .opacity(config.showCreditCard ? 0.0 : 1.0)
                    //.frame(height: config.showCreditCard ? 0.0 : 60.0)
                
                HStack {
                    NumberPadView(input: input)
                    
                    PaymentActionView(input: input, config: $config)
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.horizontal)
                .padding(.bottom, 34)
                .offset(y: config.startAnimation ? 0.0 : 300)
                .opacity(config.showCreditCard ? 0.0 : 1.0)
                .frame(height: config.showCreditCard ? 0.0 : 280.0)
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.7)) {
                config.startAnimation = true
              //  config.showCreditCard = true
              //  config.topPadding = 200
            }
        }
    }
}
