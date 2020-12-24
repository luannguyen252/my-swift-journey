//
//  PassingValuesUsingTheEnvironment.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct PassingValuesUsingTheEnvironment: View {
    // MARK: - PROPERTIES
    @ObservedObject var user = NavigationViewUser()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Score: \(user.score)")
                NavigationLink(destination: NavigationViewChangeView()) {
                    Text("Show Detail View")
                }
            }
            .navigationBarTitle("Navigation")
        }
        .environmentObject(user)
    }
}

// MARK: - PREVIEW
struct PassingValuesUsingTheEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        PassingValuesUsingTheEnvironment()
    }
}
