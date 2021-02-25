//
//  ContentView.swift
//  FundTransferApp
//
//  Created by Anik on 26/8/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dragDrop = UserDragDrop()
    @Namespace private var viewSpace
    var body: some View {
        ZStack {
            VStack {
                TopBarView()
                
                Spacer()
                
                CardView()
                    .padding(.top, 30)

                RecentlyTradedView(dragDrop: dragDrop, viewSpace: viewSpace)
                    .padding(.top, 20)

            }
            .padding(.horizontal)
            .padding(.top, 80)
            
            if dragDrop.dragDropConfig.isDroppedOnPayment {
                //need to show the payment view lets do with matched geometry animation
                PaymentView(viewSpace: viewSpace, dragDrop: dragDrop)
            }
            
            if dragDrop.dragDropConfig.isDroppedOnCollect {
                //need to show the collect view
            }
        }
        .background(Color.background)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TopBarView: View {
    var body: some View {
        HStack(spacing: 20) {
            Circle()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                Image(systemName: "bell")
            }
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
            }
        }
    }
}

extension Color {
    static let background   = Color.init(red: 1, green: 246/255, blue: 1)
    
    static let cardStart    = Color.init(red: 11/255, green: 19/255, blue: 2/255)
    static let cardEnd      = Color.init(red: 48/255, green: 53/255, blue: 27/255)
    
    static let cardLinear   = LinearGradient(
        gradient: Gradient(colors: [cardStart, cardEnd]),
        startPoint: .leading,
        endPoint: .trailing)
    
    static let logoLinear   = LinearGradient(
        gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.black]),
        startPoint: .bottomLeading,
        endPoint: .top)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
