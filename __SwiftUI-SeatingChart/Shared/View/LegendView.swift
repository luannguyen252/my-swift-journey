//
//  LegendView.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI

struct LegendView: View {
    @EnvironmentObject var config: SeatingChartConfig

    var body: some View {
        DisclosureGroup(content: {
            VStack {
                ForEach(config.seatDetailsList, id: \.id) { details in
                    if details.description == nil {
                        LegendItem(color: details.color, category: details.category, price: config.price(amount: details.price), showPrice: details.available)
                                .padding(.trailing, 20)

                    } else {
                        DisclosureGroup(content: {
                            HStack {
                                Text(details.description!)
                                        .font(.caption)
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal, 28)
                                Spacer()
                            }

                        }, label: {
                            LegendItem(color: details.color, category: details.category, price: config.price(amount: details.price), showPrice: details.available)
                        })
                    }
                }
            }.padding()
        }, label: {
            Label("Legend", systemImage: "map")
        })
    }
}

struct LegendItem: View {
    var color: Color
    var category: String
    var price: String
    var showPrice: Bool

    var body: some View {
        HStack {
            SeatView(selected: false, color: color, fill: true)
                    .frame(width: 20, height: 20)
            Text("\(category)")
            Spacer()
            if showPrice {
                Text(price)
            }
        }
    }
}
