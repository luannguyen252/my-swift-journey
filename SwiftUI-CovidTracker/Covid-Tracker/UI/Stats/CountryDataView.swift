//
//  CountryDataView.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 13.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct CountryDataView: View {
    let country: Country
    
    var body: some View {
        List {
            Section {
                HStack(alignment: .center) {
                    Text(verbatim: "Confirmed:")
                    Text(verbatim: "\(country.confirmed.formattedNumber)")
                }
            }
            Section {
                HStack(alignment: .center) {
                    Text(verbatim: "Deaths:")
                    Text(verbatim: "\(country.deaths.formattedNumber)")
                }
            }
            Section {
                HStack(alignment: .center) {
                    Text(verbatim: "Recovered:")
                    Text(verbatim: "\(country.recovered.formattedNumber)")
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle(country.name ?? "")
    }
}
