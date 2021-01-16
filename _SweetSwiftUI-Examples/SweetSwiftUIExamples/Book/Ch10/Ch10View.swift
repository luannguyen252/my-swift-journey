//
//  Ch10.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch10View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch10_1_Form()) {
                    Text("Ch10_1_Form")
                }
                NavigationLink(destination: Ch10_2_Picker()) {
                    Text("Ch10_2_Picker")
                }
                NavigationLink(destination: Ch10_3_TextField()) {
                    Text("Ch10_3_TextField")
                }
            }
            .navigationBarTitle("Ch10")
        }
    }
}

struct Ch10View_Previews: PreviewProvider {
    static var previews: some View {
        Ch10View()
    }
}
