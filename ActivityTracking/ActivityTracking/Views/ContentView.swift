//
//  ContentView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var selection: Int? = nil
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.appGrediant)
                        .frame(height: 270)

                    Rectangle()
                        .fill(Color.appWhite)
                } //: VSTACK
                .ignoresSafeArea()

                VStack(spacing: 30) {
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
                            DailyActivityView()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    selection = 1
                                }
                        }) //: NAVIGATION LINK
                    GoalsView()
                    DashboardView()

                    Spacer()
                } //: VSTACK
                .padding(.horizontal)
            } //: ZSTACK
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
