//
//  ExchangeRateViewModel.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 13.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Combine
import SwiftUI
import NetworkingLite

final class ExchangeRateViewModel: ObservableObject {
    
    private let currencyAPIClient = NetworkingLiteClient<CurrencyAPIRoutes>()
    private let baseCurrency: Currency
    private let currencies: [Currency]
    
    private(set) var exchangeRates = [ExchangeRate]() {
        didSet {
            objectWillChange.send()
        }
    }
    
    var baseCurrencyCode: String {
        return baseCurrency.code
    }
    
    init(baseCurrency: Currency, currencies: [Currency]) {
        self.baseCurrency = baseCurrency
        self.currencies = currencies
    }
    
    func requestExchangeRates() {
        currencyAPIClient.makeRequest(webServiceConfig: .getExchangeRates(baseCode: baseCurrency.code, currencies: currencies)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let quotes = try decoder.decode(RateQuotes.self, from: response.data)
                    self.exchangeRates = quotes.exchangeRates
                } catch {
                    fatalError("Check that access_key is set in CurrecyAPIRoutes.swift.")
                }
            case .error(_): break
                // TODO: Handle error in `requestExchangeRates`
            }
        }
    }
}
