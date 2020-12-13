//
//  CustomTabView.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct CustomTabView: View {
    // MARK: - PROPERTIES
    @State var selectedTab = "home"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            // Using TabView for Swipe Gestures
            // If you don't need swipe gesture tab change means just use switch case to switch views
            TabView(selection: $selectedTab) {
                Home()
                    .tag("home")
                Email()
                    .tag("email")
                Folder()
                    .tag("folder")
                Settings()
                    .tag("settings")
            } //: TAB VIEW
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            // For Bottom Overflow
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            } //: HSTACK
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.1), radius: 12, x: 4, y: 4)
            .shadow(color: Color.black.opacity(0.1), radius: 12, x: -4, y: -4)
            .padding(.horizontal)
            // For Smaller iPhones
            // Elevations
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
            // Ignoring TabView Elevation
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        // MARK: - APP BACKGROUND
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

// MARK: - TABS AND IMAGE NAMES
var tabs = ["home", "email", "folder", "settings"]
