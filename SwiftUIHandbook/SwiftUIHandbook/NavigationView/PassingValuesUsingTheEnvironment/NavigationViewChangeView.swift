//
//  NavigationViewChangeView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct NavigationViewChangeView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var user: NavigationViewUser
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Score: \(user.score)")
            Button("Increase") {
                self.user.score += 1
            }
        }
    }
}

// MARK: - PREVIEW
struct NavigationViewChangeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewChangeView()
    }
}
