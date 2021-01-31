//
//  UserView.swift
//  TabBar
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct UserView: View {
    // MARK: - BODY
    var body: some View {
        // MARK: - NAVIGATION VIEW
        NavigationView {
            Text("User Content Here.")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color("text")).opacity(0.6)
                
                //: NAVIGATION TITLE
                .navigationBarTitle("User")
        }
    }
}

// MARK: - PREVIEW
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
