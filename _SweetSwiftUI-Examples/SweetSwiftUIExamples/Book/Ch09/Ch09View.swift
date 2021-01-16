//
//  Ch09View.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch09View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch09_1_Gesture()) {
                    Text("Ch09_1_Gesture")
                }
                NavigationLink(destination: Ch09_2_ContextMenu()) {
                    Text("Ch09_2_ContextMenu")
                }
            }
            .navigationBarTitle("Ch09")
        }
    }
}

struct Ch09View_Previews: PreviewProvider {
    static var previews: some View {
        Ch09View()
    }
}
