//
//  ContentView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int? = nil
    var body: some View {
        NavigationView {
            ZStack {
                // background color
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.appGrediant)
                        .frame(height: 270)
                    
                    Rectangle()
                        .fill(Color.appWhite)
                }
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // profile stats
                    ProfileView()
                        .padding(.bottom, 30)
                        .foregroundColor(.white)
                    NavigationLink(
                        destination: ActivityDataView()
                            .navigationTitle("")
                            .navigationBarHidden(true),
                        tag: 1,
                        selection: $selection,
                        label: {
                            // Daily activity view
                            DailyActivityView()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    selection = 1
                                }
                            
                        })
                    // Goals view
                    GoalsView()
                    // Dashboard view
                    DashboardView()
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

extension Color {
    static let appBlue = Color.init(red: 94/255, green: 112/255, blue: 216/255)
    static let appPurple = Color.init(red: 202/255, green: 87/255, blue: 227/255)
    static let appWhite = Color.init(red: 246/255, green: 247/255, blue: 248/255)
    static let appSkyBlue = Color.init(red: 81/255, green: 220/255, blue: 242/255)
    
    static let appGrediant = LinearGradient(
        gradient: Gradient(colors: [appBlue, appBlue, appPurple]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let appGrediantTopLeadingToBottomTrailling = LinearGradient(
        gradient: Gradient(colors: [appBlue, appPurple]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let appGrediantWhite = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.white]),
        startPoint: .top,
        endPoint: .bottom)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
