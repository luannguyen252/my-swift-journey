//
//  Ch05.swift
//  SweetSwiftUIExamples
//
//  Created by Luan Nguyen on 16/01/2021.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch05View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Ch05_1_DataFlow()) {
                    Text("Ch05_1_DataFlow")
                }
                NavigationLink(destination: Ch05_2_Alert_ActionSheet()) {
                    Text("Ch05_2_Alert_ActionSheet")
                }
                NavigationLink(destination: Ch05_3_PresentationStyle()) {
                    Text("Ch05_3_PresentationStyle")
                }
            }
            .navigationBarTitle("Ch05")
        }
    }
}

struct Ch05View_Previews: PreviewProvider {
    static var previews: some View {
        Ch05View()
    }
}
