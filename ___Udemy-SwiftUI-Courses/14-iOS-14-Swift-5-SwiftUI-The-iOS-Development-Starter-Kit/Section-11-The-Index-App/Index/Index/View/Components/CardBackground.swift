//
//  CardBackground.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct CardBackground: View {
    var body: some View {
        Color(.white)
            .cornerRadius(20)
            .shadow(color: Color(.systemGray5), radius: 5, x: 2, y: 2)
    }
}
