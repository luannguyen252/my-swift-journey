//
//  HistoryStructure.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct HistoryStructure: Identifiable, Hashable {
    var id = UUID()
    var serviceProviderLogo: String
    var serviceName: String
    var serviceDateCharged: String
    var serviceAmountCharged: Int
}
