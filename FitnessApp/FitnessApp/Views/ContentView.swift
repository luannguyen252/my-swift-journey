//
//  ContentView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            TopNavigationBar()
                .padding(.top, 60)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            DashboardView()
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            GraphBarView()
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            Spacer()
            
            TabBarView()
                .frame(height: 100)
        } //: VSTACK
        .environmentObject(DashboardManager())
        .background(ColorConstants.backgroundLinear)
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
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
