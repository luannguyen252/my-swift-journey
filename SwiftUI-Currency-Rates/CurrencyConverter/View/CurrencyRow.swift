//
//  CurrencyRow.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 13.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct CurrencyRow: View {
    var currency: Currency
    var body: some View {
        HStack {
            CircleImage(image: currency.image)
            Text(verbatim: currency.title)
            Spacer()
        }
    }
}

#if DEBUG
struct CurrencyRow_Previews : PreviewProvider {
    static var previews: some View {
        CurrencyRow(currency: Currency(currencyCode: "USD"))
    }
}
#endif
