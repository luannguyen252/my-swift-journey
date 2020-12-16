//
//  HomeView.swift
//  TabBar
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct HomeView: View {
    // MARK: - BODY
    var body: some View {
        // MARK: - NAVIGATION VIEW
        NavigationView {
            Text("Home Content Here.")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.black).opacity(0.6)
                
                //: NAVIGATION TITLE
                .navigationBarTitle("Home")
        }
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
