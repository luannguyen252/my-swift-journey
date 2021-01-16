//
//  Ch11View.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch11View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch11_1_UIViewControllerRepresentable()) {
                    Text("Ch11_1_UIViewControllerRepresentable")
                }
                NavigationLink(destination: Ch11_2_UIViewRepresentable()) {
                    Text("Ch11_2_UIViewRepresentable")
                }
                NavigationLink(destination: Ch11_3_PreviewInUIKit()) {
                    Text("Ch11_3_PreviewInUIKit")
                }
            }
            .navigationBarTitle("Ch11")
        }
    }
}

struct Ch11View_Previews: PreviewProvider {
    static var previews: some View {
        Ch11View()
    }
}
