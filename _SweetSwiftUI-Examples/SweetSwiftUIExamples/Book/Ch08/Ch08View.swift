//
//  Ch08.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch08View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch08_1_Animation()) {
                    Text("Ch08_1_Animation")
                }
                NavigationLink(destination: Ch08_2_Transition()) {
                    Text("Ch08_2_Transition")
                }
                NavigationLink(destination: Ch08_3_CustomTransition()) {
                    Text("Ch08_3_CustomTransition")
                }
            }
            .navigationBarTitle("Ch08")
        }
    }
}

struct Ch08View_Previews: PreviewProvider {
    static var previews: some View {
        Ch08View()
    }
}
