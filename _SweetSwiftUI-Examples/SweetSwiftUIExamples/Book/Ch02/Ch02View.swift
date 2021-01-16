//
//  Ch02View.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch02_2_Text()) {
                    Text("Ch02_2_Text")
                }
                NavigationLink(destination: Ch02_3_Image()) {
                    Text("Ch02_3_Image")
                }
                NavigationLink(destination: Ch02_4_ViewLayout_Stack()) {
                    Text("Ch02_4_ViewLayout_Stack")
                }
                NavigationLink(destination: Ch02_4_ViewLayout_Spacer()) {
                    Text("Ch02_4_ViewLayout_Spacer")
                }
                NavigationLink(destination: Ch02_4_ViewLayout_Modifier()) {
                    Text("Ch02_4_ViewLayout_Modifier")
                }
            }
            .navigationBarTitle("Ch02")
        }
    }
}

struct Ch02View_Previews: PreviewProvider {
    static var previews: some View {
        Ch02View()
    }
}
