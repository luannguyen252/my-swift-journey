//
//  Ch07.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch07View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch07_1_ScrollView()) {
                    Text("Ch07_1_ScrollView")
                }
                NavigationLink(destination: Ch07_2_TabView()) {
                    Text("Ch07_2_TabView")
                }
            }
            .navigationBarTitle("Ch07")
        }
    }
}

struct Ch07View_Previews: PreviewProvider {
    static var previews: some View {
        Ch07View()
    }
}
