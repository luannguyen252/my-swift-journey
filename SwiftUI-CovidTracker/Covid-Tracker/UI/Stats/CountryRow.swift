//
//  CountryRow.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct CountryRow: View {
    let country: Country
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Text(verbatim: self.country.name ?? "")
                    .font(.headline)
                    .frame(width: geometry.size.width / 3)
                Divider()
                HStack(alignment: .center, spacing: 8) {
                    Text(verbatim: "\(self.country.active.formattedNumber)")
                        .font(.subheadline)
                    if self.country.newCases != 0 {
                        Text(verbatim: "(\(self.country.newCases.formattedNumber))")
                            .font(.subheadline)
                            .foregroundColor(self.country.newCases > 0 ? .red : .green)
                    }
                }
                .frame(width: geometry.size.width / 3 * 2)
            }
        }
    }
}
