//
//  Ch04View.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch04View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch04_1_Preview()) {
                    Text("Ch04_1_Preview")
                }
                NavigationLink(destination: Ch04_2_EnvironmentValues()) {
                    Text("Ch04_2_EnvironmentValues")
                }
            }
            .navigationBarTitle("Ch04")
        }
    }
}

struct Ch04View_Previews: PreviewProvider {
    static var previews: some View {
        Ch04View()
    }
}
