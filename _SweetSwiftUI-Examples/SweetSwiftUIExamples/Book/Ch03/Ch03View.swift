//
//  Ch03View.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch03View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch03_1_Button()) {
                    Text("Ch03_1_Button")
                }
                NavigationLink(destination: Ch03_2_NavigationView()) {
                    Text("Ch03_2_NavigationView")
                }
                NavigationLink(destination: Ch03_3_List()) {
                    Text("Ch03_3_List")
                }
                NavigationLink(destination: Ch03_4_GeometryReader()) {
                    Text("Ch03_4_GeometryReader")
                }
                NavigationLink(destination: Ch03_5_FrameModifier()) {
                    Text("Ch03_5_FrameModifier")
                }
            }
            .navigationBarTitle("Ch03")
        }
    }
}

struct Ch03View_Previews: PreviewProvider {
    static var previews: some View {
        Ch03View()
    }
}
