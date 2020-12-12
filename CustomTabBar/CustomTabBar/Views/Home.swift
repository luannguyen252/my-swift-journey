//
//  Home.swift
//  CustomTabBar
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @State var selectedTab = "Home"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation
    @StateObject var modelData = ModelView()
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { _ in
                ZStack {
                    ScrollView {
                        ForEach(1...25,id: \.self) { i in
                                NavigationLink(destination: Text("Home Data \(i)")) {
                                    VStack(alignment: .leading) {
                                        Text("Home Data \(i)")
                                            .padding()
                                            .foregroundColor(.black)
                                        
                                        Divider()
                                    }
                                }
                            }
                            .padding(.bottom)
                            .navigationBarHidden(true)
                    } //: SCROLLVIEW
                    .opacity(selectedTab == "Home" ? 1 : 0)
                    
                    Text("Restaurants")
                        .opacity(selectedTab == "Restaurants" ? 1 : 0)
                    
                    Text("Orders")
                        .opacity(selectedTab == "Orders" ? 1 : 0)
                    
                    Text("Rewards")
                        .opacity(selectedTab == "Rewards" ? 1 : 0)
                } //: ZSTACK
            } //: GEOMETRY READER
            .onChange(of: selectedTab) { (_) in
                switch(selectedTab) {
                    case "Restaurants": if !modelData.isRestaurantLoad { modelData.loadRestaurant() }
                    case "Orders": if !modelData.isOrderLoad { modelData.loadOrders() }
                    case "Rewards": if !modelData.isRewardLoad { modelData.loadReward() }
                    default: ()
                }
            }
            
            HStack(spacing: 0) {
                ForEach(tabs,id: \.self) { tab in
                    TabButton(title: tab, selectedTab: $selectedTab,animation: animation)
                    
                    if tab != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            } //: HSTACK
            .padding(.horizontal,30)
            // For iPhone 8 and SE
            .padding(.bottom,edges!.bottom == 0 ? 15 : edges!.bottom)
            .background(Color.white)
        } //: VSTACK
        .ignoresSafeArea(.all, edges: .bottom)
        //: BOX SHADOW TAB BAR
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

// MARK: - TAB BAR ITEMS
var tabs = ["Home", "Restaurants", "Orders", "Rewards"]
