//
//  HomeView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct HomeView: View {
    @State var showSideMenu = false
    @StateObject var speedSimulator = SpeedSimultor()
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            
            VStack {
                // Top menu view
                TopMenuView(showSideMenu: $showSideMenu)
                // Speed text view
                SpeedTextView(speedSimulator: speedSimulator)
                
                Spacer()
                // Progress view
                ProgressView(speedSimulator: speedSimulator)

                Spacer()
                
                // Start stop button view
                Button(action: {
                    // Start speed simulation
                    speedSimulator.startSpeedTest()
                }, label: {
                    StartStopButtonView(speedSimulator: speedSimulator)
                })
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            VStack {
                Spacer()
                DropdownView()
                    .padding(.horizontal, 30)
            }
            
            if showSideMenu {
                SideMenuView(showSideMenu: $showSideMenu)
                    .foregroundColor(.white)
            }
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
