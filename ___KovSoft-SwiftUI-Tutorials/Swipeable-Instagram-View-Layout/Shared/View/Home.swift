//
//  Home.swift
//  Instagram_DM_Swipe (iOS)
//
//  Created by Balaji on 06/02/21.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab = "house.fill"
    
    // To Update For Dark Mode...
    @Environment(\.colorScheme) var scheme
    
    @Binding var offset: CGFloat
    
    var body: some View {
        
        // Instagram Home View...
        
        TabView(selection: $selectedTab){
            
            FeedView(offset: $offset)
                .padding(.top,edges?.top)
                .tag("house.fill")
            
            Text("Search")
                .tag("magnifyingglass")
            
            Text("Reels")
                .tag("airplayvideo")
            
            Text("Liked")
                .tag("suit.heart.fill")
            
            Text("Account")
                .tag("person.circle")
        }
        .overlay(
        
            // Custom Tab Bar...
            
            VStack(spacing: 12){
                
                Divider()
                    .padding(.horizontal,-15)
                
                HStack(spacing: 0){
                    
                    TabBarButton(image: "house.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "magnifyingglass", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "airplayvideo", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "suit.heart.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "person.circle", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            .padding(.bottom,edges?.bottom ?? 15)
            .background(scheme == .dark ? Color.black : Color.white)
            
            ,alignment: .bottom
        )
        .ignoresSafeArea()
    }
}

// Tab Bar Button...

struct TabBarButton: View {
    
    var image: String
    @Binding var selectedTab: String
    
    var body: some View{
    
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(selectedTab == image ? .primary : .gray)
        })
    }
}

