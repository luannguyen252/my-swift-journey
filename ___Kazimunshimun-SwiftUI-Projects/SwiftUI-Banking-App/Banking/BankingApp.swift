//
//  BankingApp.swift
//  Banking
//
//  Created by Anik on 30/7/20.
//

import SwiftUI

@main
struct BankingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(selecedCard: cards[0])
        }
    }
}
