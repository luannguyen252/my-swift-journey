//
//  Ch06View.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch06View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch06_1_ViewModifier()) {
                    Text("Ch06_1_ViewModifier")
                }
                NavigationLink(destination: Ch06_2_CustomStyle()) {
                    Text("Ch06_2_CustomStyle")
                }
                NavigationLink(destination: Ch06_3_UIAppearance()) {
                    Text("Ch06_3_UIAppearance")
                }
            }
            .navigationBarTitle("Ch06")
        }
    }
}

struct Ch06View_Previews: PreviewProvider {
    static var previews: some View {
        Ch06View()
    }
}
