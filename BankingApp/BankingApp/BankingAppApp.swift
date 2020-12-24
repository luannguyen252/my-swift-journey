//
//  BankingAppApp.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

@main
struct BankingAppApp: App {
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView(selecedCard: cards[0])
        }
    }
}
