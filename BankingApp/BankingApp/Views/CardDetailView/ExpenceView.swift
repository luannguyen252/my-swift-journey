//
//  ExpenceView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ExpenceView: View {
    // MARK: - PROPERTIES
    @ObservedObject var cardManager: CardManager
    
    // MARK: - BODY
    var body: some View {
        VStack() {
            MenuHeaderView(title: "Expences", imageName: "ellipsis")
                .padding(.top, 16)
                .padding(.bottom, 16)
            ExpenceGraphView(cardManager: cardManager)
        } //: VSTACK
    }
}
