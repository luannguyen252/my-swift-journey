//
//  TitleCard.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct TitleCard: View {
    var body: some View {
        ZStack {
            CardBackground()
            CardLabel(title: "Index", caption: "BMI Calculator")
        } .frame(width: 300, height: 500)
        // End of ZStack
    }
}
