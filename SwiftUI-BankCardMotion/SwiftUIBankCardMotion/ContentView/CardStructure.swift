//
//  CardStructure.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct CardStructure: Identifiable {
    var id = UUID()
    var cardNumber: String
    var cardName: String
    var cardProviderLogo: String
    var cardCurrency: String
    var cardAmount: Int
    var linearColor1: Color
    var linearColor2: Color
    var shadow: Color
}
