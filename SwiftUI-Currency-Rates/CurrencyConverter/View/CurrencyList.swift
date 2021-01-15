//
//  CurrencyListView.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 12.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct CurrencyList: View {
    var body: some View {
        NavigationView {
            List(currencies) { currency in
                NavigationLink(destination: ExchangeRateList(viewModel: ExchangeRateViewModel(baseCurrency: currency, currencies: currencies))) {
                   CurrencyRow(currency: currency)
                }
            }.navigationBarTitle(Text("Currencies"), displayMode: .large)
        }
    }
}

#if DEBUG
struct CurrencyList_Previews : PreviewProvider {
    static var previews: some View {
        CurrencyList()
    }
}
#endif
