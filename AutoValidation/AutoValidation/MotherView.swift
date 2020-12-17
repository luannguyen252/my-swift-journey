//
//  MotherView.swift
//  AutoValidation
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct MotherView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var viewRouter: ViewRouter
    
    // MARK: - BODY
    var body: some View {
        VStack {
            if viewRouter.currentPage == "home" {
                Text("Home")
            } else if viewRouter.currentPage == "pin" {
                ContentView()
            }
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
