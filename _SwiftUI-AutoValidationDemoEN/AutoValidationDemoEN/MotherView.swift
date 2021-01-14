//
//  MotherView.swift
//  AutoValidationDemoEN
//
//  Created by Farukh IQBAL on 31/03/2020.
//  Copyright © 2020 Farukh IQBAL. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "home" {
                Text("Home")
            } else if viewRouter.currentPage == "pin" {
                ContentView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
