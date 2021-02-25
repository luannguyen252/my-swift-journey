//
//  TitleCard.swift
//  Calorie
//
//  Created by Pao Yu on 2020-07-30.
//

import SwiftUI

struct TitleCard: View {
    var body: some View {
        
        ZStack {
            CardBackground()
            CardLabel(title: "Calorie", caption: "BMR Calculator")
        } .frame(width: 300, height: 500)
    }
}
