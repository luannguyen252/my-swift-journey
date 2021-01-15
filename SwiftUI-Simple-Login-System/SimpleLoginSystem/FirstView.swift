//
//  FirstView.swift
//  SimpleLoginSystem
//
//  Created by Gaspard Rosay on 27.01.20.
//  Copyright © 2020 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var loginSettings: LoginSettings
    var body: some View {
        Group{
            if loginSettings.showLoginPage {
                LoginView()
            }
            else {
                ContentView()
            }
        }
    }
}
