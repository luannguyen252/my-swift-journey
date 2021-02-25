//
//  ExpenceView.swift
//  Banking
//
//  Created by Anik on 1/8/20.
//

import SwiftUI

struct ExpenceView: View {
    @ObservedObject var cardManager: CardManager
    var body: some View {
        VStack {
            MenuHeaderView(title: "Expences", imageName: "ellipsis")
                .padding(.bottom, 20)
            ExpenceGraphView(cardManager: cardManager)
        }
    }
}
